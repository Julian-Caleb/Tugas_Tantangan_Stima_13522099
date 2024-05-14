# Algoritma didefinisikan dengan menggunakan sebuah fungsi f yang menghitung jarak terpendek dengan
# basis jika semua node sudah dikunjungi, maka kembali ke node 1,  
# Basis: 
#   f(nodeTerakhir, sisaNode) = jarak[nodeTerakhir, 1]
# dengan sisaNode adalah array kosong karena semua node telah dikunjungi
# Rekurens:
#   f(nodeTerakhir, sisaNode) = jarak[nodeTerakhir, node] + f(node, sisaNodeTanpaNode)
# dengan node berlaku untuk setiap elemen dari sisaNode dan sisaNodeTanpaNode adalah sisaNode - node

# Sebagai tambahan, untuk menyimpan path dan memasukkan matrix, fungsi f dimodifikasi menjadi
# f(nodeTerakhir, sisaNode. nodePath, matrix) yang mengembalikan tuple [cost, path]
# Penjelasan lebih lanjut terdapat di dalam fungsi

# Fungsi f
def f(nodeTerakhir, sisaNode, nodePath, matrix)
    # Debug
    # puts "Node saat ini: #{nodeTerakhir}"
    # puts "Sisa node: #{sisaNode}"
    # puts

    # Basis
    # Jika tidak ada node yang bisa dikunjungi, kembali ke node awal yaitu 1
    if sisaNode.empty?
        # Memasukkan path dengan nodeTerakhir -> 1
        path = nodePath.dup
        path.unshift(1)
        path.unshift(nodeTerakhir)

        # Mengembalikan jarak node terakhir ke 1 dan pathnya
        return [matrix[nodeTerakhir - 1][1 - 1], path]
    end

    # Instansiasi variabel untuk menampung semua kemungkinan
    tempCost = []
    tempPath = []

    # Rekurens
    # Jika masih ada node yang bisa dikunjungi, untuk setiap node
    sisaNode.each do |node|
        # Debug
        # puts "Pergi ke node: #{node}"

        # Menghapus node dari sisaNode
        sisaNodeTanpaNode = sisaNode.dup
        sisaNodeTanpaNode.delete(node)

        # Melakukan rekurens
        nextMove = f(node, sisaNodeTanpaNode, nodePath, matrix)

        # Append cost dan path ke dalam variabel penampung
        tempCost << (matrix[nodeTerakhir - 1][node - 1] + nextMove[0])
        tempPath << nextMove[1]
    end

    # Mencari cost paling kecil
    cost = tempCost.min

    # Mencari path yang tepat berdasarkan cost yang dipilih
    idx = tempCost.index(cost)
    path = tempPath[idx]

    # Masukkan node sekarang ke dalam path yang terpilih
    path.unshift(nodeTerakhir)

    # Mengembalikan [cost, path]
    return [cost, path]
end
