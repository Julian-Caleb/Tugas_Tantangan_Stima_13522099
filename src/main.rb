# Import fungsi tsp dari tsp.rb
require_relative 'tsp'

# Judul
puts "=== TRAVELING SALESMAN PROBLEM USING DYNAMIC PROGRAMMING ==="

# Instansiasi matrix ketetanggaan
matrix = nil

# Loop hingga filename valid
loop do
    # Meminta input filename
    print "Input filename in test folder: "
    filename = gets.chomp
    filepath = "test/#{filename}.txt"
    puts

    # Pembacaan file
    begin
        # Asumsi isi file valid
        # Baca setiap line
        lines = File.readlines(filepath)

        # Mengubah line menjadi komponen matrix
        matrix = lines.map do |line|
            # Split berdasarkan spasi dan ubah menjadi integer
            line.split.map(&:to_i) 
        end
    
        # Debug
        puts "Isi matrix: #{matrix}"
        puts
        break

    # Kalau file tidak ditemukan
    rescue Errno::ENOENT
        puts "File #{filepath} tidak ditemukan. Silahkan coba lagi."

    # Kalau ada error
    rescue => e
        puts "Error: #{e.message}. Silahkan coba lagi."
    end
end

# Algoritma TSP dengan menggunakan Dynamic Programming
# Asumsikan perjalanan dimulai dari dan berakhir pada simpul 1

# Matrix (matrix ketetanggaan) dibaca sebagai array of array dengan baris asal node dan kolom adalah node tujuan
# matrix[1][2] berarti dari node 1 ke node 2

# Matrix menggunakan asumsi nilai 9999 berarti tidak bertetangga

# Instansiasi variabel yang dibutuhkan, meliputi:
# - nodeAwal yaitu 1
# - sisaNode yaitu array node selain 1
# - path berupa empty array
matrixLength = matrix.length
nodeAwal = 1
sisaNode = (2..matrixLength).to_a
path = []

# Memanggil fungsi f dari tsp.rb
tspResult = f(nodeAwal, sisaNode, path, matrix)

# tspResult merupakan tuple [cost, path]
# Mencetak hasil
puts "Lowest cost: #{tspResult[0]}"
puts "Path: #{tspResult[1].inspect}"
  

