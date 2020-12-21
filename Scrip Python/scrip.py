import psycopg2
import random

tablas= ['''CREATE TABLE cliente ( 
                id_cliente BIGSERIAL, 
                nombre VARCHAR(30), 
                apellido VARCHAR(30),
                telefono VARCHAR(11),
                email VARCHAR(50),
                fecha_pago_suscripcion DATE,
                PRIMARY KEY (id_cliente));''',
                
                '''CREATE TABLE transaccion (
                    id_transaccion BIGSERIAL,
                    id_cliente INT,
                    fecha DATE,
                    PRIMARY KEY (id_transaccion),
                    CONSTRAINT fk_id_cliente
                    FOREIGN KEY (id_cliente)
                    REFERENCES cliente(id_cliente)
                );''',
                '''CREATE TABLE categoria (
                    id_categoria BIGSERIAL,
                    nombre VARCHAR(30),
                    PRIMARY KEY (id_categoria)
                ); ''',
                ''' CREATE TABLE productos (
                    id_productos BIGSERIAL,
                    id_categoria INT,
                    nombre VARCHAR(30),
                    precio NUMERIC,
                    stock NUMERIC,
                    PRIMARY KEY (id_productos),
                    CONSTRAINT fk_id_categoria
                    FOREIGN KEY (id_categoria)
                    REFERENCES categoria(id_categoria)
                );''',
                ''' CREATE TABLE detalle(
                    id_detalle BIGSERIAL,
                    id_transaccion INT,
                    id_producto INT,
                    cantidad NUMERIC,
                    total NUMERIC,
                    PRIMARY KEY (id_detalle),
                    CONSTRAINT fk_id_transaccion
                    FOREIGN KEY (id_transaccion)
                    REFERENCES transaccion(id_transaccion)
                );''']






data = [
	{"nombre": "Wendy", "apellido": "Sargent", "telefono": "0894148648", "email": "auctor.non.feugiat@nequepellentesquemassa.org", "fecha": "03/06/20"},
	{"nombre": "Dexter", "apellido": "Rush", "telefono": "0820322547", "email": "et.arcu.imperdiet@eratvel.org", "fecha": "07/01/20"},
	{"nombre": "Jacob", "apellido": "Bell", "telefono": "0515332267", "email": "diam.dictum@odio.edu", "fecha": "10/02/20"},
	{"nombre": "Raymond", "apellido": "Ingram", "telefono": "0489852144", "email": "est.tempor.bibendum@Nuncmauris.edu", "fecha": "11/05/20"},
	{"nombre": "Chaim", "apellido": "Burke", "telefono": "0632071152", "email": "amet.consectetuer.adipiscing@ultricesmausipsum.ca", "fecha": "01/08/20"},
	{"nombre": "Cade", "apellido": "Lane", "telefono": "0883849240", "email": "feugiat@vestibulum.co.uk", "fecha": "05/09/20"},
	{"nombre": "Dillon", "apellido": "Nielsen", "telefono": "0832035463", "email": "eget.odio@sitametconsectetuer.net", "fecha": "04/12/20"},
	{"nombre": "Gannon", "apellido": "Kent", "telefono": "0833347963", "email": "ligula.eu.enim@feugiattellus.org", "fecha": "03/11/20"},
	{"nombre": "Delilah", "apellido": "Sexton", "telefono": "0499817245", "email": "vitae@lobortis.net", "fecha": "12/04/20"},
	{"nombre": "Emi", "apellido": "Witt", "telefono": "0976049406", "email": "sem.consequat@infaucibusorci.edu", "fecha": "08/10/20"},
	{"nombre": "Libby", "apellido": "Holloway", "telefono": "0645880957", "email": "pede@tempus.net", "fecha": "05/06/20"},
    {"nombre": "Amber", "apellido": "Decker", "telefono": "0799677197", "email": "id@Cras.co.uk", "fecha": "06/12/20"},
	{"nombre": "Lewis", "apellido": "French", "telefono": "0551416892", "email": "augue.Sed@sedsemegestas.co.uk", "fecha": "10/03/20"},
	{"nombre": "Melissa", "apellido": "Blackburn", "telefono": "0352161176", "email": "arcu.Vestibulum.ante@tristiquepharetra.co.uk", "fecha": "09/08/20"},
	{"nombre": "Rudyard", "apellido": "Cross", "telefono": "0618459788", "email": "vel.pede@dapibus.net", "fecha": "09/03/20"},
	{"nombre": "Hollee", "apellido": "Berg", "telefono": "0727981736", "email": "fringilla.ornare@aliquetmolestietellus.ca", "fecha": "05/05/20"},
	{"nombre": "Byron", "apellido": "Mosley", "telefono": "0752145861", "email": "velit.Quisque.varius@magnaPraesent.org", "fecha": "06/12/20"},
	{"nombre": "Irma", "apellido": "Mcknight", "telefono": "0806670509", "email": "et.arcu@sitametlorem.org", "fecha": "03/07/20"},
	{"nombre": "Jaime", "apellido": "Sanchez", "telefono": "0415265423", "email": "elit.pede@sagittissemper.ca", "fecha": "03/07/20"},
	{"nombre": "Conan", "apellido": "Callahan", "telefono": "0477320416", "email": "luctus.felis.purus@in.co.uk", "fecha": "03/06/20"},
	{"nombre": "Heidi", "apellido": "Norris", "telefono": "0594385973", "email": "montes@ametlorem.co.uk", "fecha": "10/01/20"},
	{"nombre": "Carla", "apellido": "Holden", "telefono": "0676739510", "email": "velit@idnuncinterdum.ca", "fecha": "03/01/20"},
	{"nombre": "Aaron", "apellido": "Gillespie", "telefono": "0189524801", "email": "Suspendisse@orci.net", "fecha": "08/11/20"},
	{"nombre": "Shaeleigh", "apellido": "Long", "telefono": "0784206046", "email": "tempus.non@Donecluctus.co.uk", "fecha": "01/04/20"},
	{"nombre": "Hall", "apellido": "Holden", "telefono": "0421912440", "email": "lorem.auctor.quis@dolor.edu", "fecha": "03/07/20"},
	{"nombre": "Cedric", "apellido": "Edwards", "telefono": "053722652", "email": "amet@auctor.ca", "fecha": "06/06/20"},
	{"nombre": "Caryn", "apellido": "Byers", "telefono": "0822331661", "email": "eget@vitae.edu", "fecha": "01/02/20"},
	{"nombre": "Andrew", "apellido": "Rose", "telefono": "0727177083", "email": "luctus.et@nuncsedpede.org", "fecha": "11/04/20"},
	{"nombre": "Edward", "apellido": "Pugh", "telefono": "0922572805", "email": "Donec.porttitor.tellus@quisdiamluctus.com", "fecha": "02/03/20"},
	{"nombre": "Hamish", "apellido": "Phelps", "telefono": "0836874043", "email": "eros.nec.tellus@Fusce.org", "fecha": "02/01/20"},
	{"nombre": "Laith", "apellido": "Crosby", "telefono": "0815488337", "email": "sed.facilisis.vitae@ornarelectusante.ca", "fecha": "09/07/20"},
	{"nombre": "Kitra", "apellido": "Lambert", "telefono": "0605540886", "email": "est.arcu@feugiattelluslorem.com", "fecha": "04/12/20"}]


productos = [
    {'nombre':'Toalla de Mano', 'precio':2500, 'stock': 100, 'id_categoria':1},
    {'nombre':'Toalla de Cuerpo', 'precio':5000, 'stock': 100, 'id_categoria':1},
    {'nombre':'Gorro de piscina', 'precio':1500, 'stock': 100, 'id_categoria':1},
    {'nombre':'Shampoo 10ml', 'precio':500, 'stock': 100, 'id_categoria':1},
    {'nombre':'Jabon 50gr', 'precio':500, 'stock': 100, 'id_categoria':1},
    {'nombre':'Barra de Proteina 45gr', 'precio':1500, 'stock': 100, 'id_categoria':1},
    {'nombre':'Chocolate 35gr', 'precio':300, 'stock': 100, 'id_categoria':1},
    {'nombre':'Batido proteico', 'precio':1500, 'stock': 100, 'id_categoria':1},
    {'nombre':'Agua mineral 500cc', 'precio':600, 'stock': 100, 'id_categoria':1},
    {'nombre':'Bebida isotonica', 'precio':1200, 'stock': 100, 'id_categoria':1},
    {'nombre':'Acceso Total', 'precio':7000, 'stock': 100, 'id_categoria':2},
    {'nombre':'Acceso a Maquinas', 'precio':2500, 'stock': 100, 'id_categoria':2},
    {'nombre':'Acceso piscina', 'precio':5000, 'stock': 100, 'id_categoria':2},
    {'nombre':'Clases Dirigidas', 'precio':3000, 'stock': 100, 'id_categoria':2},
    {'nombre':'Plan Mensual', 'precio':25000, 'stock': 100, 'id_categoria':3},
    {'nombre':'Plan Trimestal', 'precio':70000, 'stock': 100, 'id_categoria':3},
    {'nombre':'Plan Cuatrimestral', 'precio':90000, 'stock': 100, 'id_categoria':3},
    {'nombre':'Plan Semestral', 'precio':150000, 'stock': 100, 'id_categoria':3},
    {'nombre':'Plan Anual', 'precio':250000, 'stock': 100, 'id_categoria':3}]


fechas = ['01/01/2020',
        '01/01/2020',
        '01/01/2020',
        '03/01/2020',
        '03/01/2020',
        '03/01/2020',
        '03/01/2020',
        '04/01/2020',
        '04/01/2020',
        '04/01/2020',
        '04/01/2020',
        '04/01/2020',
        '04/01/2020',
        '04/01/2020',
        '05/01/2020',
        '05/01/2020',
        '05/01/2020',
        '05/01/2020',
        '05/01/2020',
        '05/01/2020',
        '05/01/2020',
        '06/01/2020',
        '06/01/2020',
        '06/01/2020',
        '06/01/2020',
        '06/01/2020',
        '07/01/2020',
        '07/01/2020',
        '07/01/2020',
        '07/01/2020',
        '08/01/2020',
        '08/01/2020',
        '08/01/2020',
        '09/01/2020',
        '09/01/2020',
        '10/01/2020',
        '10/01/2020',
        '10/01/2020',
        '11/01/2020',
        '11/01/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '01/02/2020',
        '02/02/2020',
        '02/02/2020',
        '02/02/2020',
        '02/02/2020',
        '02/02/2020',
        '03/02/2020',
        '03/02/2020',
        '03/02/2020',
]




try: 
    print('Conectando a la base de datos PostgreSQL...')
    conexion = psycopg2.connect(user="postgres",
                            password="12345", #AGREGAR CONTRASEÑA
                            host="localhost",
                            port="5432",
                            database="gymasia")

# creación del cursor
    cur = conexion.cursor()
        
    # Ejecución de una consulta con la version de PostgreSQL
    print('La version de PostgreSQL es la:')
    cur.execute('SELECT version()')

    # Ahora mostramos la version
    version = cur.fetchone()

    print(version)
    '''for tabla in tablas:
        cur.execute(tabla)'''
    ''' cur.execute(ALTER TABLE detalle
        ADD CONSTRAINT fk_id_productos
        FOREIGN KEY (id_producto)
        REFERENCES productos (id_productos);)'''

    '''#Insertar datos en clientes
    for dato in range(0,len(data)):
        elem = data[dato]
        #print(elem['nombre'], elem['apellido'], elem['telefono'])
        cur.execute ("INSERT INTO cliente(nombre, apellido, telefono, email, fecha_pago_suscripcion)"+
        " VALUES ('"+elem['nombre']+"', '"+elem['apellido']+"', '"+elem['telefono']+"', '"+elem['email']+
        "', '"+elem['fecha']+"');")'''

    '''#insertando productos
    for prod in range(0, len(productos)):
        producto = productos[prod]
        cur.execute("INSERT INTO productos(nombre, precio, stock, id_categoria) " + 
            "VALUES('" + producto['nombre'] +"', " + str(producto['precio'])+", "+ str(producto['stock']) +", " 
            +str(producto['id_categoria']) +");" )'''

    '''# generacion de datos de transaccion
    for numero in range(1,len(fechas)):
        id_cliente = random.randint(26,57)
        cur.execute("INSERT INTO transaccion(id_transaccion, id_cliente, fecha) " +
        "VALUES("+ str(numero) +", " +str(id_cliente)+", '"+ fechas[numero] + "');")'''

    cur.execute('SELECT id_productos, nombre, precio FROM productos')

    # obtenemos los productos de la base de datos
    prod = cur.fetchall()
    
    # generador de datos de detalle
    for num in range(1,57):
        plan = False
        for producto in range(2,random.randint(2,5)):
            id_producto = random.randint(2,18)
            if str(prod[id_producto-1][0]) in ['16','17','18', '19', '20'] and plan == False:
                plan = True
                cur.execute("INSERT INTO detalle (id_transaccion, id_producto, cantidad, total) " +
                "VALUES("+ str(num) + ", "+ str(id_producto+1) +", "+ str(1) +", "+ str(prod[id_producto-1][2]) +");")
            else:
                cur.execute("INSERT INTO detalle (id_transaccion, id_producto, cantidad, total) " +
                "VALUES("+ str(num) + ", "+ str(id_producto+1) +", "+ str(1) +", "+ str(prod[id_producto-1][2]) +");")

# Cierre de la comunicación con PostgreSQL
    cur.close()
    conexion.commit()
except (Exception, psycopg2.Error) as error :
    print ("Error", error)

finally:
    if conexion is not None:
        conexion.close()
        print('Conexión finalizada.')

