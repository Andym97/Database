from tkinter import *
import tkinter.messagebox as MessageBox
import mysql.connector as mysql

def insert():
    lid = e_lid.get()
    pcid = e_pcid.get()
    pid = e_pid.get()
    name= e_name.get()
    weight = e_weight.get()
    size = e_size.get()
    battery = e_battery.get()
    con = mysql.connect(host="100.40.107.156", user="", password="",
                        database="pcdb", auth_plugin = 'mysql_native_password')
    cursor = con.cursor()
    cursor.execute("insert into laptop values('"+ lid +"','"+name+"','"+weight+"','"
                   +size+"','"+pid+'","'+pcid+'","'+battery+"')")
    cursor.execute("commit");

    MessageBox.showinfo("Inserted Successfully");
    con.close();

def showlaptops():
    con = mysql.connect(host="100.40.107.156", user="", password="",
                        database="pcdb", auth_plugin = 'mysql_native_password')
    cursor = con.cursor()
    cursor.execute("select * from laptop")
    rows = cursor.fetchall()
    for row in rows:
        insertData = str(row[0])+ '      ' + row[1]
        list.insert(list.size()+1, insertData)

    con.close()
        

root = Tk()
root.geometry("1200x900")
root.title("PCDB Interface")

lid = Label(root,text='Enter Laptop  ID',font=('bold', 10))
lid.place(x=20, y=30)

e_lid = Entry()
e_lid.place(x=130, y=30)

pcid = Label(root,text='Enter PC      ID',font=('bold', 10))
pcid.place(x=20, y=60)

e_pcid = Entry()
e_pcid.place(x=130, y=60)

pid = Label(root,text='Enter Product ID',font=('bold', 10))
pid.place(x=20, y=90);
                   
e_pid = Entry()
e_pid.place(x=130, y=90)

name = Label(root,text='Enter Name',font=('bold', 10))
name.place(x=20, y=120);

e_name = Entry()
e_name.place(x=130, y=120)

weight = Label(root,text='Enter Weight',font=('bold', 10))
weight.place(x=20, y=150)

e_weight = Entry()
e_weight.place(x=130, y=150)

size = Label(root,text='Enter Screen Size',font=('bold', 10))
size.place(x=20, y=180);

e_size = Entry()
e_size.place(x=130, y=180)

battery = Label(root,text='Enter Battery Size',font=('bold', 10))
battery.place(x=20, y=210)

e_battery = Entry()
e_battery.place(x=130, y=210)


insert = Button(root, text='Insert', font = ("Bold", 10), bg='white', command=insert)
insert.place(x=20, y=240)

show = Button(root, text='Show', font = ("Bold", 10), bg='white', command=showlaptops)
show.place(x=60, y=240)

list = Listbox(root)
list.place(x=300, y=30)
