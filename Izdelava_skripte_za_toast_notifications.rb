$moskaImena = nil
$zenskaImena = nil
$kraji = nil

def Zacetek()
  puts "Samodejna izdelava skripte..."
  puts "Avtor: Tadej B."
  x = gets
  system('cls')
end

def Vnos()
  puts "Vnos mnozic za nakljucno dodeljevanje:"
  puts "Elementi naj bodo med seboj ločeni z ',' besedilo pa mora biti brez prehodov v novo vrsto!"
  puts ""
  puts "Moska imena: "
  $moskaImena = gets.chomp
  $moskaImena = $moskaImena + ','
  puts "Zenska imena: "
  $zenskaImena = gets.chomp
  $zenskaImena = $zenskaImena + ','
  puts "Kraji:"
  $kraji = gets.chomp
  $kraji = $kraji + ','
  puts ""
  puts "Poljubna tipka za naprej..."
  x = gets
  system('cls')
  puts "Vnos linearnih elementov:"
  puts "Elementi naj bodo med seboj ločeni z ',' besedilo pa mora biti brez prehodov v novo vrsto!"
  puts ""
  puts "Mesto z nakljucnim Moskim imenom ... '/m' "
  puts "Mesto z nakljucnim Zenskim imenom ... '/z' "
  puts "Mesto z nakljucnim Krajem ... '/k' "
  puts ""
  puts "-> "
  $besedila = gets.chomp
  $besedila = $besedila + ','
  puts "Poljubna tipka za naprej..."
  x = gets
end

def Izpis(n)
  puts "-" * n
end

def ObdelavaVnosov()
  $seznamMoskihImen = $moskaImena.split(",")
  $seznamZenskihImen = $zenskaImena.split(",")
  $seznamKrajev = $kraji.split(",")
  $seznamBesedil = $besedila.split(",")
  system('cls')
  Izpis(30)
  puts "Stevilo moskih imen: #{$seznamMoskihImen.size} "
  puts "Stevilo moskih imen: #{$seznamZenskihImen.size} "
  puts "Stevilo krajev: #{$seznamKrajev.size} "
  Izpis(30)
  puts "Moska imena: "
  $seznamMoskihImen.each do |tmp|
    puts tmp
  end
  Izpis(30)
  puts "Zenska imena: "
  $seznamZenskihImen.each do |tmp|
    puts tmp
  end
  Izpis(30)
  puts "Kraji: "
  $seznamKrajev.each do |tmp|
    puts tmp
  end
  Izpis(30)
  puts "Besedila: "
  $seznamBesedil.each do |tmp|
    puts tmp
  end
  Izpis(30)
  puts "Poljubna tipka za naprej..."
  x = gets
end

def IzdelavaDatoteke()
  datoteka = open("skripta.txt", 'w')
  datoteka.puts('<script type="text/javascript">')
  datoteka.puts('var delayCas = 0;')
  datoteka.puts('var i = 0;')
  puts "Max. kosov: "
  maxKosov = gets
  maxKosovS = maxKosov.to_i
  puts "Min. kosov: "
  minKosov = gets
  minKosovS = minKosov.to_i
  razlika = maxKosovS-minKosovS
  puts "razlika: #{razlika}"
  #var steviloKosov = Math.floor(Math.random() * 5 + 25);
  tmp = 'var steviloKosov = Math.floor(Math.random() *  ' + razlika.to_s + ' + ' + minKosovS.to_s + ');'
  datoteka.puts(tmp)
# => var steviloObiskovalcev = Math.floor(Math.random() * 140 + 260);
  puts "Max. obiskovalcev: "
  maxKosov = gets
  maxKosovS = maxKosov.to_i
  puts "Min. obiskovalcev: "
  minKosov = gets
  minKosovS = minKosov.to_i
  razlika = maxKosovS-minKosovS
  puts "razlika: #{razlika}"
  tmp = 'var steviloObiskovalcev = Math.floor(Math.random() *  ' + razlika.to_s + ' + ' + minKosovS.to_s + ');'
  datoteka.puts(tmp)
# => var timeoutCas = ((Math.random() * 5) + 1)*1000;
  puts "Max. casa: "
  maxKosov = gets
  maxKosovS = maxKosov.to_i
  puts "Min. casa: "
  minKosov = gets
  minKosovS = minKosov.to_i
  razlika = maxKosovS-minKosovS
  puts "razlika: #{razlika}"
  tmp = 'var timeoutCas = Math.floor(Math.random() *  ' + razlika.to_s + ' + ' + minKosovS.to_s + ') * 1000;'
  $timeoutCaSstring = tmp
  datoteka.puts(tmp)
  niz = 'var seznamMoskihImen = ['
  $seznamMoskihImen.each do |tmp|
    niz += '"'+tmp+'",'
  end
  niz += ']'
  datoteka.puts(niz)
  datoteka.puts('var stMoskih = seznamMoskihImen.length')

  niz = 'var seznamZenskihImen = ['
  $seznamZenskihImen.each do |tmp|
    niz +='"'+tmp+'",'
  end
  niz += ']'
  datoteka.puts(niz)
  datoteka.puts('var stZensk = seznamZenskihImen.length')

  niz = 'var seznamKrajev = ['
  $seznamKrajev.each do |tmp|
    niz += '"'+tmp+'",'
  end
  niz += ']'
  datoteka.puts(niz)
  datoteka.puts('var stKrajev = seznamKrajev.length')
  datoteka.puts('var stack_bottomright = {"dir1": "up", "dir2": "left", "firstpos1": 25, "firstpos2": 25};')

  # => Main loop
  i = 0
  $seznamBesedil.each do |trenutnaVrstica|
    tmp = ""
    i += 1
    j = i
    tmp = 'var stavek'+j.to_s+' = "'
    trenutnaVrstica = trenutnaVrstica.gsub('/m', '" + seznamMoskihImen[i] ')
    trenutnaVrstica = trenutnaVrstica.gsub('/z', '" + seznamZenskihImen[j] ')
    trenutnaVrstica = trenutnaVrstica.gsub('/k', '" + seznamKrajev[k] ')
    for pos in 0...trenutnaVrstica.length
      if trenutnaVrstica[pos] == ']'
        if pos < trenutnaVrstica.length
          trenutnaVrstica.insert(pos+1, ' + "')
        end
      end
    end
    tmp += trenutnaVrstica
    datoteka.puts (tmp)
    $timeoutCaSstring = $timeoutCaSstring.gsub("var","")
    datoteka.puts ($timeoutCaSstring)
    datoteka.puts('i = Math.floor(Math.random() * stMoskih);')
    datoteka.puts('j = Math.floor(Math.random() * stZensk);')
    datoteka.puts('k = Math.floor(Math.random() * stKrajev);')
    tmp = "setTimeout('a"+j.to_s+"()', timeoutCas);"
    datoteka.puts (tmp)
    tmp = 'function a'+j.to_s+'(){new PNotify({'
    datoteka.puts(tmp)
    tmp = 'text: stavek'+j.to_s+','
    datoteka.puts(tmp)
    datoteka.puts('delay: 3000,')
    datoteka.puts("addclass: 'stack-bottomright',")
    datoteka.puts('stack: stack_bottomright,')
    datoteka.puts('buttons: {')
    datoteka.puts('sticker: false')
    datoteka.puts('}')
    datoteka.puts('});')
    datoteka.puts('}')
  end # => Konec main loopa
  datoteka.puts('</script>')
end


Zacetek()
Vnos()
ObdelavaVnosov()
IzdelavaDatoteke()

puts "moska imena zunaj: #{$moskaImena}"

x = gets
