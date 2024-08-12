import os
from flask import Flask, request, render_template, jsonify, redirect, session, url_for, send_file
from flask_mysqldb import MySQL
from datetime import datetime
from werkzeug.utils import secure_filename
from flask import send_from_directory
from datetime import datetime
import pdfkit


# path_to_wkhtmltopdf = r'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'
# config = pdfkit.configuration(wkhtmltopdf=path_to_wkhtmltopdf)

app = Flask(__name__)
app.secret_key = '12345678'

# MySQL configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'tokosembako'
app.config['UPLOAD_FOLDER'] = 'uploads'
mysql = MySQL(app)


# Error handling and security improvements
@app.errorhandler(404)
def not_found(error):
    return render_template('errors/404.html'), 404

@app.errorhandler(500)
def internal_server_error(error):
    return render_template('errors/500.html'), 500

def round_to_two_decimals(value):
    return round(value, 2)


#ROUTE FRONTEND
@app.route("/")
@app.route("/login")
def login():        
    if 'username' in session:
        return redirect('/dashboard')
    else:
        return render_template("auth/login.html", title="Login")


@app.route("/profile")
def profile():        
    if 'username' not in session:
        return redirect('/login')
    else:
        return render_template("auth/profile.html", title="Profile")
    
@app.route("/dashboard")
def index():            
    if 'username' not in session:
        return redirect('/login')
    else:
        db = mysql.connection.cursor()
        db.execute("SELECT COUNT(*) FROM items")
        total_barang = db.fetchone()[0]
        db.close()

        db = mysql.connection.cursor()
        db.execute("SELECT COUNT(*) FROM sales")
        total_penjualan = db.fetchone()[0]
        db.close()

        return render_template("manage/dashboard.html", title="Dashboard", total_barang=total_barang, total_penjualan=total_penjualan)

@app.route("/barang")
def barang():            
    if 'username' not in session:
        return redirect('/login')
    else:
        return render_template("manage/barang.html", title="Barang")

@app.route("/penjualan")
def penjualan():            
    if 'username' not in session:
        return redirect('/login')
    else:     

        db = mysql.connection.cursor()
        db.execute("SELECT * FROM items ORDER BY name ASC")
        barang = db.fetchall()
        db.close()

        return render_template("manage/penjualan.html", title="Penjualan", barang=barang)


@app.route("/penjualan/transaksi/<int:id>")
def penjualan_transaksi(id):   
    db = mysql.connection.cursor()
    db.execute("SELECT * FROM sales WHERE id=%s",(id,))
    sales = db.fetchone()
    db.close()
    
    db = mysql.connection.cursor()
    db.execute("SELECT * FROM items ORDER BY name ASC")
    items = db.fetchall()
    db.close()

    return render_template("manage/penjualan_detail.html", title="Penjualan Detail", id=id, items=items, tanggal=sales[3])




@app.route("/proses")
def proses():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        return render_template("manage/proses.html", title="Proses")

@app.route("/hasil")
def hasil():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        return render_template("manage/hasil.html", title="Hasil")

#FUNCTION
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'png', 'jpg', 'jpeg', 'gif'}


@app.route('/uploads/<filename>')
def send_uploaded_file(filename=''):
    if filename and os.path.exists(os.path.join(app.config["UPLOAD_FOLDER"], filename)):
        return send_from_directory(app.config["UPLOAD_FOLDER"], filename)
    else:
        return send_from_directory('static/img', 'noimage.png')

#ROUTE BACKEND
@app.route("/signin", methods=["POST"])
def signin():
    try:
        username = request.form.get("username")
        password = request.form.get("password")
        
        db = mysql.connection.cursor()
        db.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
        user = db.fetchone()
        db.close()

        if user:
            session['username'] = user[1]
            session['level'] = user[2]
            return jsonify({
                "success": True,
                "message": "Berhasil masuk!",
                "username": user[1],
                "redirect": "/dashboard"
            })
        else:
            return jsonify({
                "success": False,
                "message": "Gagal masuk. Periksa kembali username dan password Anda."
            })
    except Exception as e:
        return jsonify({"success": False, "message": str(e)})


@app.route("/signout")
def signout():
    session.clear()
    return redirect("/")


#=================================================================================================
@app.route("/barang/data")
def barang_data():
         
    if 'username' not in session:
        return redirect('/login')
    else:    

        try:
            keywords = request.args.get("keywords", '')
            sortBy = request.args.get("sortBy", 'desc')
            limitBy = int(request.args.get("limitBy", 30))

            query = "SELECT * FROM items"
            
            if keywords:
                query += f" WHERE name LIKE '%{keywords}%'"
            if sortBy:
                query += f" ORDER BY updated_at {sortBy}"
            if limitBy:
                query += f" LIMIT {limitBy}"

            db = mysql.connection.cursor()
            db.execute(query)
            data = db.fetchall()
            db.close()

            response = {
                "success": True,
                "message": "Berhasil memuat data!",
                "data": data,
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
    
@app.route("/barang/data/<int:id>")
def barang_by(id):     
    if 'username' not in session:
        return redirect('/login')
    else:     
        try:
            db = mysql.connection.cursor()
            db.execute("SELECT * FROM items WHERE id=%s", (id,))
            data = db.fetchone()
            db.close()

            if data:
                response = {
                    "success": True,
                    "message": "Berhasil memuat data!",
                    "data": data,
                }
            else:
                response = {
                    "success": False,
                    "message": "Data tidak ditemukan",
                }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
    
@app.route("/barang/simpan", methods=["POST"])
def barang_simpan():
    if 'username' not in session:
        return redirect('/login')
    else:
        try:
            id = int(request.form.get("id"))
            name = request.form.get("name")
            price = float(request.form.get("price"))
            qty = float(request.form.get("qty"))
            now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

            db = mysql.connection.cursor()

            image_path = None
            if 'image' in request.files:
                image = request.files['image']
                if image and allowed_file(image.filename):
                    filename = secure_filename(image.filename)
                    image_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
                    image.save(image_path)

            if id > 0:
                if image_path:
                    db.execute("UPDATE items SET name = %s, price = %s, qty = %s, image = %s, updated_at = %s WHERE id = %s", 
                               (name, price, qty, image_path.replace("\\", "/"), now, id))
                else:
                    db.execute("UPDATE items SET name = %s, price = %s, qty = %s, updated_at = %s WHERE id = %s", 
                               (name, price, qty, now, id))
            else:
                if image_path:
                    db.execute("INSERT INTO items (name, price, qty, image, created_at, updated_at) VALUES (%s, %s, %s, %s, %s, %s)", 
                               (name, price, qty, image_path.replace("\\", "/"), now, now))
                else:
                    db.execute("INSERT INTO items (name, price, qty, created_at, updated_at) VALUES (%s, %s, %s, %s, %s)", 
                               (name, price, qty, now, now))

            mysql.connection.commit()

            response = {
                "success": True,
                "message": "Berhasil menambah data!",
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
    
@app.route("/barang/hapus", methods=["POST"])
def barang_hapus():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        try:
            id = int(request.form.get("id"))

            db = mysql.connection.cursor()
            db.execute("SELECT image FROM items WHERE id = %s", (id,))
            image_path = db.fetchone()[0]
            db.close()

            db = mysql.connection.cursor()
            db.execute("DELETE FROM items WHERE id = %s", (id,))
            mysql.connection.commit()
            db.close()

            if image_path:
                os.remove(image_path)

            response = {
                "success": True,
                "message": "Berhasil hapus data!",
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})


@app.route("/barang/export-pdf/<int:id>")
def barang_export(id):

    db = mysql.connection.cursor()
    query_items = "SELECT * FROM items"
    db.execute(query_items)
    items_result = db.fetchall()
    db.close()


    items_data = [
        {
            'nomor': index + 1,
            'name': row[1],
            'image': row[2],
            'price': row[3],
            'qty': row[4]
        }
        for index, row in enumerate(items_result)
    ]

    return render_template(
            "manage/barang_export.html", 
            title="Barang", 
            items=items_data, 
            )


    
#=================================================================================================
@app.route("/penjualan/data")
def penjualan_data():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        try:        
            keywords = request.args.get("keywords", '')
            sortBy = request.args.get("sortBy", 'desc')
            limitBy = int(request.args.get("limitBy", 30))

            query = "SELECT sales.*,items.name,items.price FROM sales JOIN items ON items.id=sales.item_id"
            
            if keywords:
                query += f" WHERE items.name LIKE '%{keywords}%'"
            if sortBy:
                query += f" ORDER BY sales.updated_at {sortBy}"
            if limitBy:
                query += f" LIMIT {limitBy}"

            db = mysql.connection.cursor()
            db.execute(query)
            data = db.fetchall()
            db.close()

            response = {
                "success": True,
                "message": "Berhasil memuat data!",
                "data": data,
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})


@app.route("/penjualan/tanggal")
def penjualan_tanggal():   
    # if 'username' not in session:
    #     return redirect('/login')
    # else:      
        try:        
            keywords = request.args.get("keywords", '')
            sortBy = request.args.get("sortBy", 'desc')
            limitBy = int(request.args.get("limitBy", 30))

            query = "SELECT * FROM sales"            
            
            if sortBy:
                query += f" ORDER BY sales.updated_at {sortBy}"
            if limitBy:
                query += f" LIMIT {limitBy}"

            db = mysql.connection.cursor()
            db.execute(query)
            rows = db.fetchall()

            sales_data = []
            for row in rows:
                id = row[0]
                
                db.execute("SELECT sales_item.*,items.name,items.price FROM sales_item JOIN items ON items.id=sales_item.item_id WHERE sales_item.sale_id=%s", (id,))
                items = db.fetchall()

                sales_data.append({
                    'id': row[0],
                    'tanggal': row[3],
                    'items': items,
                })

            db.close()

            response = {
                "success": True,
                "message": "Berhasil memuat data!",
                "data": sales_data
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
    

@app.route("/penjualan/data/<string:tanggal>")
def penjualan_bytanggal(tanggal):   
    if 'username' not in session:
        return redirect('/login')
    else:        
        try:
            db = mysql.connection.cursor()
            db.execute("SELECT sales.*, items.name, items.price FROM sales JOIN items ON items.id = sales.item_id WHERE DATE(sales.created_at)=%s", (tanggal,))
            data = db.fetchall()
            db.close()

            if data:
                response = {
                    "success": True,
                    "message": "Berhasil memuat data!",
                    "data": data,
                }
            else:
                response = {
                    "success": False,
                    "message": "Tidak ada data penjualan untuk tanggal ini",
                }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
    


@app.route("/penjualan/buat", methods=["POST"])
def penjualan_buat():        
        try:
            now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

            db = mysql.connection.cursor()
            db.execute("INSERT INTO sales (created_at,updated_at) VALUES (%s,%s)", (now, now))
            mysql.connection.commit()
            id = db.lastrowid
            db.close()
            
            url = f"/penjualan/transaksi/{id}"
            response = {
                "success": True,
                "message": "Berhasil hapus data!",
                "url" : url
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})

    

@app.route("/penjualan/hapus", methods=["POST"])
def penjualan_hapus():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        try:
            id = int(request.form.get("id"))

            db = mysql.connection.cursor()
            db.execute("DELETE FROM sales WHERE id = %s", (id,))
            mysql.connection.commit()
            db.close()

            response = {
                "success": True,
                "message": "Berhasil hapus data!",
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
        


@app.route("/penjualan/data/<int:id>")
def penjualan_byid(id): 
    # if 'username' not in session:
    #     return redirect('/login')
    # else:         
        try:
            db = mysql.connection.cursor()
            db.execute("SELECT * FROM sales_item WHERE id=%s", (id,))
            data = db.fetchone()
            db.close()

            if data:
                response = {
                    "success": True,
                    "message": "Berhasil memuat data!",
                    "data": data,
                }
            else:
                response = {
                    "success": False,
                    "message": "Data tidak ditemukan",
                }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})


@app.route("/penjualan/transaksi/detail/<int:id>")
def penjualan_transaksi_detail(id):   
    try:
        db = mysql.connection.cursor()
        db.execute("SELECT sales_item.*,items.name,items.price FROM sales_item JOIN items ON items.id=sales_item.item_id WHERE sales_item.sale_id=%s", (id,))
        data = db.fetchall()
        db.close()

        response = {
            "success": True,
            "message": "Berhasil memuat data!",
            "data": data,
        }

        return jsonify(response)

    except Exception as e:
        return jsonify({"success": False, "message": str(e)})
    
@app.route("/penjualan/transaksi/data/<int:id>")
def penjualan_transaksi_data(id):   
    try:
        db = mysql.connection.cursor()
        db.execute("SELECT sales_item.*,items.name,items.price FROM sales_item JOIN items ON items.id=sales_item.item_id WHERE sales_item.id=%s", (id,))
        data = db.fetchone()
        db.close()

        response = {
            "success": True,
            "message": "Berhasil memuat data!",
            "data": data,
        }

        return jsonify(response)

    except Exception as e:
        return jsonify({"success": False, "message": str(e)})


@app.route("/penjualan/transaksi/simpan", methods=["POST"])
def penjualan_transaksi_simpan():     
    try:
        id = int(request.form.get("id"))
        item_id = int(request.form.get("item"))
        quantity = int(request.form.get("quantity"))
        sale_id = int(request.form.get("sale_id"))
        now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        db = mysql.connection.cursor()

        if id > 0:
            db.execute("UPDATE sales_item SET item_id = %s, quantity = %s, updated_at = %s WHERE id = %s AND sale_id = %s", (item_id, quantity, now, id, sale_id))
            action = "perbarui"
        else:
            db.execute("INSERT INTO sales_item (item_id, sale_id, quantity, created_at, updated_at) VALUES (%s, %s, %s, %s, %s)", (item_id, sale_id, quantity, now, now))
            action = "menambah"

        mysql.connection.commit()

        response = {
            "success": True,
            "message": f"Berhasil {action} data!",
        }

        return jsonify(response)
    except Exception as e:
        return jsonify({"success": False, "message": str(e)})

@app.route("/penjualan/transaksi/hapus", methods=["POST"])
def penjualan_transaksi_hapus():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        try:
            id = int(request.form.get("id"))

            db = mysql.connection.cursor()
            db.execute("DELETE FROM sales_item WHERE id = %s", (id,))
            mysql.connection.commit()
            db.close()

            response = {
                "success": True,
                "message": "Berhasil hapus data!",
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
    


@app.route("/penjualan/export-pdf/<int:id>")
def penjualan_export(id):

    db = mysql.connection.cursor()
    query_sales = "SELECT sales_item.*,items.name,items.price FROM sales_item JOIN items ON items.id=sales_item.item_id"
    db.execute(query_sales)
    sales_result = db.fetchall()
    db.close()


    sales_data = [
        {
            'nomor': index + 1,
            'tahun': row[4].strftime("%Y"),
            'tanggal': row[4].strftime("%Y-%m-%d"),
            'jam': row[4].strftime("%H:%M:%S"),
            'name': row[6],
            'price': row[7],
            'qty': row[3]
        }
        for index, row in enumerate(sales_result)
    ]

    return render_template(
            "manage/penjualan_export.html", 
            title="Penjualan", 
            sales=sales_data, 
            )





@app.route("/proses/buat", methods=["POST"])
def proses_buat():        
        try:
            start_date = request.form.get("start_date")
            end_date = request.form.get("end_date")
            min_support = request.form.get("min_support")
            min_confidence = request.form.get("min_confidence")
            min_left = request.form.get("min_left")

            db = mysql.connection.cursor()
            db.execute("INSERT INTO process_log (start_date,end_date,min_support,min_confidence,min_left) VALUES (%s,%s,%s,%s,%s)", (start_date, end_date, min_support, min_confidence, min_left))
            mysql.connection.commit()
            id = db.lastrowid
            db.close()
            
            response = {
                "success": True,
                "message": "Berhasil memproses data!",
                "id" : id
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})
        


@app.route("/proses/apriori", methods=["POST"])
def proses_apriori():
    db = None
    try:
        log_id = request.form.get("id")
        
        # Ensure log_id is not empty and is a number
        if not log_id:
            raise ValueError("ID log tidak boleh kosong")
        
        # Connect to the database
        db = mysql.connection.cursor()

        query = "SELECT * FROM process_log WHERE id = %s"
        db.execute(query, (log_id,))
        log = db.fetchone()

        # Ensure log data is found
        if log is None:
            raise ValueError("Data log tidak ditemukan")

        start_date = log[1]
        end_date = log[2]
        supportThreshold = log[3]
        minConfidence = log[4]
        minLift = log[5]

        # Fetch sales data
        query_sales = "SELECT * FROM sales WHERE DATE(updated_at) BETWEEN %s AND %s ORDER BY updated_at DESC"
        db.execute(query_sales, (start_date, end_date))
        sales_result = db.fetchall()

        semua = []
        data = []
        for row in sales_result:
            updated_at = row[3]
            sale_id = row[0]

            # Fetch sales items
            query_items = "SELECT items.name FROM sales_item JOIN items ON items.id=sales_item.item_id WHERE sales_item.sale_id=%s"
            db.execute(query_items, (sale_id,))
            items_result = db.fetchall()

            items = [item[0].lower() for item in items_result if isinstance(item[0], str)]
            data.append((updated_at, items))

        # Data Transactions
        semua.append(("data", data))

        # Get unique items
        items = list(set(item for _, transaction_items in data for item in transaction_items))

        # Initialize table with transactions as key and all items as value with a default value of 0
        table = {str(transaction[0]): {item: 0 for item in items} for transaction in data}

        # Fill table with a value of 1 if the item is present in the transaction
        for transaction in data:
            for item in transaction[1]:
                table[str(transaction[0])][item] = 1

        # Count the number of transactions
        numTransactions = len(table)

        # Calculate support for each item
        itemSum = {}
        for item in items:
            jumlah = sum(table[transaction][item] for transaction in table)
            support = jumlah / numTransactions
            itemSum[item] = [support, jumlah]

        # Display list of purchased items
        print("Data 1 Item:")
        print(items)
        print()

        # Display transaction table
        print("Tabel Transaksi:")
        print(table)
        print()

        print("itemSupport:")
        print(itemSum)
        print()

        # Display 1-ITEMSET
        print("1-ITEMSET:")
        oneitemset = []
        for item in items:
            jumlah = itemSum[item][1] if item in itemSum else 0
            support = itemSum[item][0] if item in itemSum else 0
            keterangan = 'Lolos' if support >= supportThreshold else 'Tidak Lolos'
            oneitemset.append({
                'item': item,
                'jumlah': jumlah,
                'support': support,
                'keterangan': keterangan
            })

        print(oneitemset)
        print()

        # Display 1-ITEMSET LOLOS (items with support above the threshold)
        print("1-ITEMSET LOLOS:")
        oneitemsetSupport = []
        oneitemsetSelected = []
        for atribut, sums in itemSum.items():
            jumlah = sums[1] if sums else 0
            support = sums[0] if sums else 0
            lolos = 0
            if support >= supportThreshold:
                oneitemsetSupport.append(atribut)
                oneitemsetSelected.append({
                    'item': atribut,
                    'jumlah': jumlah,
                    'support': support
                })
                lolos = 1

            # Save to itemset1 table
            db.execute("INSERT INTO itemset1 (atribut, jumlah, support, lolos, id_process) VALUES (%s, %s, %s, %s, %s)", (atribut, jumlah, support, lolos, log_id))
        
        mysql.connection.commit()
        
        semua.append(("oneitemset", oneitemset))

        print(oneitemsetSelected)
        print()

        # Generate candidate 2-ITEMSET from items that passed the previous iteration
        twoItemsetCombinate = [(item1, item2) for i, item1 in enumerate(oneitemsetSupport) for item2 in oneitemsetSupport[i + 1:]]
        print("Tabel Kombinasi 2 Item:")
        print(twoItemsetCombinate)
        print()

        twoItemsetCombinateSupport = []
        twoItemsetCombinateSelected = []
        for itemset in twoItemsetCombinate:
            b = {}
            jumlah = 0
            for transaksi, itemValues in table.items():
                a = {}
                x = []
                for item in itemset:
                    a[item] = itemValues[item]
                    x.append(itemValues[item])

                hasil = x[0] * x[1] if len(x) >= 2 else 0
                a['hasil'] = hasil
                b[transaksi] = a
                jumlah += hasil

            support = jumlah / numTransactions
            keterangan = 'Lolos' if support >= supportThreshold else 'Tidak Lolos'
            twoItemsetCombinateSupport.append({
                'item': ', '.join(itemset),
                'data': b,
                'transaksi': jumlah,
                'support': support,
                'keterangan': keterangan
            })

            lolos = 0
            if support >= supportThreshold:
                twoItemsetCombinateSelected.append({
                    'item': ', '.join(itemset),
                    'transaksi': jumlah,
                    'support': support
                })
                lolos = 1

            # Save to itemset2 table
            db.execute("INSERT INTO itemset2 (atribut1, atribut2, jumlah, support, lolos, id_process) VALUES (%s, %s, %s, %s, %s, %s)", (itemset[0], itemset[1], jumlah, support, lolos, log_id))
        
        mysql.connection.commit()
        
        semua.append(("twoitemset", twoItemsetCombinateSupport))

        print("2-ITEMSET:")
        print(twoItemsetCombinateSupport)
        print()

        print("2-ITEMSET LOLOS:")
        print(twoItemsetCombinateSelected)
        print()

        threeItemsetCombinate = [item['item'] for item in twoItemsetCombinateSelected]
        print("Data 2 Item dari data yang lolos:")
        print(threeItemsetCombinate)
        print()

        # Generate candidate 3-ITEMSET from items that passed the previous iteration
        threeItemKombinasi = {}
        for item in threeItemsetCombinate:
            items = item.split(', ')
            key = items[0]

            if key not in threeItemKombinasi:
                threeItemKombinasi[key] = item
            else:
                existingItems = threeItemKombinasi[key].split(', ')
                mergedItems = sorted(list(set(existingItems + items)))
                threeItemKombinasi[key] = ', '.join(mergedItems)

        threeItemKombinasi = list(filter(lambda x: len(x.split(', ')) == 3, threeItemKombinasi.values()))
        print("Tabel Kombinasi 2 item jadi 3 Item:")
        print(threeItemKombinasi)
        print()

        threeItemsetCombinateSupport = []
        threeItemsetCombinateSelected = []
        for itemset in threeItemKombinasi:
            itemset = itemset.split(", ")
            b = {}
            jumlah = 0
            for transaksi, itemValues in table.items():
                a = {}
                x = []
                for item in itemset:
                    a[item] = itemValues[item]
                    x.append(itemValues[item])

                hasil = x[0] * x[1] * x[2] if len(x) >= 3 else 0
                a['hasil'] = hasil
                b[transaksi] = a
                jumlah += hasil

            support = jumlah / numTransactions
            keterangan = 'Lolos' if support >= supportThreshold else 'Tidak Lolos'
            threeItemsetCombinateSupport.append({
                'Item': ', '.join(itemset),
                'Transaksi': b,
                'jumlah': jumlah,
                'support': support,
                'keterangan': keterangan
            })

            lolos = 0
            if support >= supportThreshold:
                threeItemsetCombinateSelected.append({
                    'item': ', '.join(itemset),
                    'transaksi': jumlah,
                    'support': support
                })
                lolos = 1

            # Save to itemset3 table
            db.execute("INSERT INTO itemset3 (atribut1, atribut2, atribut3, jumlah, support, lolos, id_process) VALUES (%s, %s, %s, %s, %s, %s, %s)", (itemset[0], itemset[1], itemset[2], jumlah, support, lolos, log_id))
        
        mysql.connection.commit()
        
        semua.append(("threeitemset", threeItemsetCombinateSupport))

        print("3-ITEMSET:")
        print(threeItemsetCombinateSupport)
        print()

        print("3-ITEMSET LOLOS:")
        print(threeItemsetCombinateSelected)
        print()

        # Calculate confidence and lift for 2-itemsets
        for itemset in twoItemsetCombinateSelected:
            items = itemset['item'].split(', ')
            jumlah = itemset['transaksi']
            supportAB = itemset['support']

            supportA = itemSum[items[0]][0] if items[0] in itemSum else 0
            supportB = itemSum[items[1]][0] if items[1] in itemSum else 0

            confidenceAtoB = supportAB / supportA if supportA != 0 else 0
            liftAtoB = confidenceAtoB / supportB if supportB != 0 else 0

            confidenceBtoA = supportAB / supportB if supportB != 0 else 0
            liftBtoA = confidenceBtoA / supportA if supportA != 0 else 0

            lolos1 = 0
            if confidenceAtoB >= minConfidence and liftAtoB >= minLift:
                lolos1 = 1
            db.execute("INSERT INTO confidence (kombinasi1, kombinasi2, support_xUy, support_x, confidence, lolos, min_support, min_confidence, nilai_uji_lift, korelasi_rule, id_process, jumlah_a, jumlah_b, jumlah_ab, px, py, pxuy, from_itemset) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 2)",
                       (items[0], items[1], supportAB, supportA, confidenceAtoB, lolos1, supportThreshold, minConfidence, liftAtoB, 'A => B', log_id, itemSum[items[0]][1], itemSum[items[1]][1], jumlah, supportA, supportB, supportAB))

            lolos2 = 0
            if confidenceBtoA >= minConfidence and liftBtoA >= minLift:
                lolos2 = 1
            db.execute("INSERT INTO confidence (kombinasi1, kombinasi2, support_xUy, support_x, confidence, lolos, min_support, min_confidence, nilai_uji_lift, korelasi_rule, id_process, jumlah_a, jumlah_b, jumlah_ab, px, py, pxuy, from_itemset) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 2)",
                       (items[1], items[0], supportAB, supportB, confidenceBtoA, lolos2, supportThreshold, minConfidence, liftBtoA, 'B => A', log_id, itemSum[items[1]][1], itemSum[items[0]][1], jumlah, supportB, supportA, supportAB))


        mysql.connection.commit()

        # Calculate confidence and lift for 3-itemsets
        for itemset in threeItemsetCombinateSelected:
            items = itemset['item'].split(', ')
            jumlah = itemset['transaksi']
            supportABC = itemset['support']

            supportA = itemSum[items[0]][0] if items[0] in itemSum else 0
            supportB = itemSum[items[1]][0] if items[1] in itemSum else 0
            supportC = itemSum[items[2]][0] if items[2] in itemSum else 0

            supportAB = next((x['support'] for x in twoItemsetCombinateSelected if x['item'] == f"{items[0]}, {items[1]}" or x['item'] == f"{items[1]}, {items[0]}"), 0)
            supportAC = next((x['support'] for x in twoItemsetCombinateSelected if x['item'] == f"{items[0]}, {items[2]}" or x['item'] == f"{items[2]}, {items[0]}"), 0)
            supportBC = next((x['support'] for x in twoItemsetCombinateSelected if x['item'] == f"{items[1]}, {items[2]}" or x['item'] == f"{items[2]}, {items[1]}"), 0)

            confidenceABtoC = supportABC / supportAB if supportAB != 0 else 0
            liftABtoC = confidenceABtoC / supportC if supportC != 0 else 0
            lolos1 = 0
            if confidenceABtoC >= minConfidence and liftABtoC >= minLift:
                lolos1 = 1
            db.execute("INSERT INTO confidence (kombinasi1, kombinasi2, support_xUy, support_x, confidence, lolos, min_support, min_confidence, nilai_uji_lift, korelasi_rule, id_process, jumlah_a, jumlah_b, jumlah_ab, px, py, pxuy, from_itemset) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 3)",
                       (f"{items[0]}, {items[1]}", items[2], supportABC, supportAB, confidenceABtoC, lolos1, supportThreshold, minConfidence, liftABtoC, 'AB => C', log_id, itemSum[items[0]][1], itemSum[items[1]][1], jumlah, supportAB, supportC, supportABC))

            confidenceAtoBC = supportABC / supportA if supportA != 0 else 0
            liftAtoBC = confidenceAtoBC / (supportB * supportC) if (supportB * supportC) != 0 else 0
            lolos2 = 0
            if confidenceAtoBC >= minConfidence and liftAtoBC >= minLift:
                lolos2 = 1
            db.execute("INSERT INTO confidence (kombinasi1, kombinasi2, support_xUy, support_x, confidence, lolos, min_support, min_confidence, nilai_uji_lift, korelasi_rule, id_process, jumlah_a, jumlah_b, jumlah_ab, px, py, pxuy, from_itemset) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 3)",
                       (items[0], f"{items[1]}, {items[2]}", supportABC, supportA, confidenceAtoBC, lolos2, supportThreshold, minConfidence, liftAtoBC, 'A => BC', log_id, itemSum[items[0]][1], itemSum[items[1]][1], jumlah, supportA, supportC, supportABC))

            confidenceBCtoA = supportABC / supportBC if supportBC != 0 else 0
            liftBCtoA = confidenceBCtoA / supportA if supportA != 0 else 0
            lolos3 = 0
            if confidenceBCtoA >= minConfidence and liftBCtoA >= minLift:
                lolos3 = 1
            db.execute("INSERT INTO confidence (kombinasi1, kombinasi2, support_xUy, support_x, confidence, lolos, min_support, min_confidence, nilai_uji_lift, korelasi_rule, id_process, jumlah_a, jumlah_b, jumlah_ab, px, py, pxuy, from_itemset) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 3)",
                       (f"{items[1]}, {items[2]}", items[0], supportABC, supportBC, confidenceBCtoA, lolos3, supportThreshold, minConfidence, liftBCtoA, 'BC => A', log_id, itemSum[items[1]][1], itemSum[items[2]][1], jumlah, supportBC, supportA, supportABC))

            
        mysql.connection.commit()


        # Analyze and insert into analisa table for 2-itemset
        query_confidence = "SELECT * FROM confidence WHERE id_process = %s AND lolos=1"
        db.execute(query_confidence, (log_id,))
        confidence_result = db.fetchall()

        # Process confidence data
        for confidence_item in confidence_result:
            kombinasi1 = confidence_item[1]
            kombinasi2 = confidence_item[2]
            support_xUy = confidence_item[3]
            support_x = confidence_item[4]
            confidence_val = confidence_item[5]
            lolos = confidence_item[6]
            min_support = confidence_item[7]
            min_confidence = confidence_item[8]
            nilai_uji_lift = confidence_item[9]
            korelasi_rule = confidence_item[10]
            jumlah_a = confidence_item[12]
            jumlah_b = confidence_item[13]
            jumlah_ab = confidence_item[14]
            px = confidence_item[15]
            py = confidence_item[16]
            pxuy = confidence_item[17]
            from_itemset = confidence_item[18]

            # Process and insert into analisa table if the rule passes
            if lolos:
                if from_itemset == 2:
                    keterangan = f"Jika konsumen membeli {kombinasi1} maka konsumen membeli {kombinasi2}"
                elif from_itemset == 3:
                    keterangan = f"Jika konsumen membeli {kombinasi1}, {kombinasi2} maka konsumen membeli {kombinasi2}"
                db.execute("INSERT INTO analisa (kombinasi1, kombinasi2, keterangan, from_itemset, id_process) VALUES (%s, %s, %s, %s, %s)",
                           (kombinasi1, kombinasi2, keterangan, from_itemset, log_id))

        mysql.connection.commit()


        print()

        url = f"/proses/result/{log_id}"
        response = {
            "success": True,
            "url": url,
        }

        return jsonify(response)
    except ValueError as ve:
        return jsonify({"success": False, "message": str(ve)})
    except Exception as e:
        return jsonify({"success": False, "message": str(e)})
    finally:
        if db:
            db.close()



@app.route("/proses/data")
def proses_data():     
    if 'username' not in session:
        return redirect('/login')
    else:     
        try:        
            keywords = request.args.get("keywords", '')
            sortBy = request.args.get("sortBy", 'desc')
            limitBy = int(request.args.get("limitBy", 30))

            query = "SELECT * FROM process_log"
            
            if keywords:
                query += f" WHERE start_date LIKE '%{keywords}%'"
            if sortBy:
                query += f" ORDER BY start_date {sortBy}"
            if limitBy:
                query += f" LIMIT {limitBy}"

            db = mysql.connection.cursor()
            db.execute(query)
            data = db.fetchall()
            db.close()

            response = {
                "success": True,
                "message": "Berhasil memuat data!",
                "data": data,
            }

            return jsonify(response)
        except Exception as e:
            return jsonify({"success": False, "message": str(e)})

@app.route("/proses/result/<int:log_id>")
def proses_result(log_id):
        db = None
        
        # Connect to the database
        db = mysql.connection.cursor()


        query_log = "SELECT * FROM process_log WHERE id = %s"
        db.execute(query_log, (log_id,))
        process_log = db.fetchone()

        # Fetch data from itemset1 table
        query_itemset1 = "SELECT * FROM itemset1 WHERE id_process = %s"
        db.execute(query_itemset1, (log_id,))
        itemset1_result = db.fetchall()

        query_itemset1 = "SELECT * FROM itemset1 WHERE id_process = %s AND lolos=1"
        db.execute(query_itemset1, (log_id,))
        itemset1_lolos_result = db.fetchall()

        # Fetch data from itemset2 table
        query_itemset2 = "SELECT * FROM itemset2 WHERE id_process = %s"
        db.execute(query_itemset2, (log_id,))
        itemset2_result = db.fetchall()

        query_itemset2 = "SELECT * FROM itemset2 WHERE id_process = %s AND lolos=1"
        db.execute(query_itemset2, (log_id,))
        itemset2_lolos_result = db.fetchall()

        # Fetch data from itemset3 table
        query_itemset3 = "SELECT * FROM itemset3 WHERE id_process = %s"
        db.execute(query_itemset3, (log_id,))
        itemset3_result = db.fetchall()

        query_itemset3 = "SELECT * FROM itemset3 WHERE id_process = %s AND lolos=1"
        db.execute(query_itemset3, (log_id,))
        itemset3_lolos_result = db.fetchall()

        # Fetch data from confidence table
        query_confidence = "SELECT * FROM confidence WHERE id_process = %s"
        db.execute(query_confidence, (log_id,))
        confidence_result = db.fetchall()

        # Fetch data from analisa
        query_analisa = "SELECT * FROM analisa WHERE id_process = %s"
        db.execute(query_analisa, (log_id,))
        analisa_result = db.fetchall()


        # Structure the results into dictionaries
        process_log_data = {
                'start_date': process_log[1],
                'end_date': process_log[2],
                'min_support': process_log[3],
                'min_confidence': process_log[4],
                'min_left': process_log[5]
            }

        itemset1_data = [
            {
                'atribut': row[1],
                'jumlah': row[2],
                'support': round_to_two_decimals(row[3]),
                'lolos': row[4]
            }
            for row in itemset1_result
        ]

        itemset1_lolos_data = [
            {
                'atribut': row[1],
                'jumlah': row[2],
                'support': round_to_two_decimals(row[3]),
                'lolos': row[4]
            }
            for row in itemset1_lolos_result
        ]

        itemset2_data = [
            {
                'atribut1': row[1],
                'atribut2': row[2],
                'jumlah': row[3],
                'support': round_to_two_decimals(row[4]),
                'lolos': row[5]
            }
            for row in itemset2_result
        ]

        itemset2_lolos_data = [
            {
                'atribut1': row[1],
                'atribut2': row[2],
                'jumlah': row[3],
                'support': round_to_two_decimals(row[4]),
                'lolos': row[5]
            }
            for row in itemset2_lolos_result
        ]

        itemset3_data = [
            {
                'atribut1': row[1],
                'atribut2': row[2],
                'atribut3': row[3],
                'jumlah': row[4],
                'support': round_to_two_decimals(row[5]),
                'lolos': row[6]
            }
            for row in itemset3_result
        ]

        itemset3_lolos_data = [
            {
                'atribut1': row[1],
                'atribut2': row[2],
                'atribut3': row[3],
                'jumlah': row[4],
                'support': round_to_two_decimals(row[5]),
                'lolos': row[6]
            }
            for row in itemset3_lolos_result
        ]

        confidence_data = [
            {
                'kombinasi1': row[1],
                'kombinasi2': row[2],
                'support_xUy': round_to_two_decimals(row[3]),
                'support_x': round_to_two_decimals(row[4]),
                'confidence': row[5],
                'lolos': row[6],
                'min_support': row[7],
                'min_confidence': row[8],
                'nilai_uji_lift': row[9],
                'korelasi_rule': row[10],
                'id_process': row[11],
                'jumlah_a': row[12],
                'jumlah_b': row[13],
                'jumlah_ab': row[14],
                'px': round_to_two_decimals(row[15]),
                'py': round_to_two_decimals(row[16]),
                'pxuy': round_to_two_decimals(row[17]),
                'from_itemset': row[18]
            }
            for row in confidence_result
        ]

        analisa_data = [
            {
                'kombinasi1': row[1],
                'kombinasi2': row[2],
                'keterangan': row[3],
                'from_itemset': row[4]
            }
            for row in analisa_result
        ]


        response = {
            "success": True,
            "itemset1": itemset1_data,
            "itemset2": itemset2_data,
            "itemset3": itemset3_data,
            "confidence": confidence_data,
            "analisa": analisa_data
        }

        db.close()
    
        return render_template(
            "manage/proses_result.html", 
            title="Proses Result", 
            id=log_id, 
            log=process_log_data,
            itemset1=itemset1_data, 
            itemset1_lolos=itemset1_lolos_data, 
            itemset2=itemset2_data, 
            itemset2_lolos=itemset2_lolos_data, 
            itemset3=itemset3_data, 
            itemset3_lolos=itemset3_lolos_data, 
            confidence=confidence_data, 
            analisa=analisa_data
            )

@app.route("/proses/export-pdf/<int:log_id>")
def proses_export(log_id):

    db = mysql.connection.cursor()
    query_log = "SELECT * FROM process_log WHERE id = %s"
    db.execute(query_log, (log_id,))
    process_log = db.fetchone()

    db = mysql.connection.cursor()
    query_analisa = "SELECT * FROM analisa WHERE id_process = %s"
    db.execute(query_analisa, (log_id,))
    analisa_result = db.fetchall()
    db.close()


    process_log_data = {
                'start_date': process_log[1],
                'end_date': process_log[2],
                'min_support': process_log[3],
                'min_confidence': process_log[4],
                'min_left': process_log[5]
            }


    analisa_data = [
        {
            'nomor': index + 1,
            'kombinasi1': row[1],
            'kombinasi2': row[2],
            'keterangan': row[3],
            'from_itemset': row[4]
        }
        for index, row in enumerate(analisa_result)
    ]

    return render_template(
            "manage/proses_export.html", 
            title="PDF Result", 
            log=process_log_data,
            analisa=analisa_data, 
            )





@app.route("/hasil/export-pdf/<int:id>")
def hasil_export(id):
    db = mysql.connection.cursor()
    query_logs = "SELECT * FROM process_log"
    db.execute(query_logs)
    logs_result = db.fetchall()
    db.close()

    logs_data = [
        {
            'nomor': index + 1,
            'start_date': row[1],
            'end_date': row[2],
            'min_support': row[3],
            'min_confidence': row[4],
            'min_left': row[5]
        }
        for index, row in enumerate(logs_result)
    ]

    return render_template("manage/hasil_export.html", title="Barang", logs=logs_data)
    # rendered = render_template("manage/hasil_export.html", title="Barang", logs=logs_data)
    
    # # Save the rendered template as a PDF file
    # pdf_path = f"hasil_export_{id}.pdf"
    # pdfkit.from_string(rendered, pdf_path, configuration=config)

    # # Send the file as a response
    # return send_file(pdf_path, as_attachment=True)


#=================================================================================================

if __name__ == "__main__":
    app.run(port=6002, debug=True)
