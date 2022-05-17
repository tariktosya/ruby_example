#!/usr/bin/ruby
# encoding: utf-8


# Sekil soyut sınıfı
class Sekil
    def initialize; end # OVERRIDE ME
  
    def yazdir; end # OVERRIDE ME
  
    def bilgi_al; end # OVERRIDE ME
  
    def alan; end # OVERRIDE ME
  
    def hacim; end # OVERRIDE ME
  end
  
  # İki koordinati olan IkiBoyutluSekil sınıfı
  class IkiBoyutluSekil < Sekil
    BOYUT = 2 #Sınıf sabiti olarak tutmak istedim
    def initialize(x=0, y=0) #Varsayılar koordinatlar orijin
      @x = x
      @y = y
    end
  end
  
  # Üç koordinatı olan UcBoyutluSekil sınıfı
  class UcBoyutluSekil < IkiBoyutluSekil
    BOYUT = 3 # Sınıf sabiti olarak tutmak istedim 
    def initialize(x=0, y=0, z=0) # Varsayılan koordinatlar orijin
      super x, y
      @z = z
    end
  end
  
  # Kenar uzunluğu parametresi alan iki boyutlu KARE sınıfı
  class Kare < IkiBoyutluSekil
  
    NAME = self.to_s # Şeklin ismini bir değişkende tut
  
    def initialize(x=0, y=0)
      super x, y
    end
  
    def yazdir
      puts "------------------------------------------------"
      puts "Nesnenin şekli: #{NAME}"
      puts "Nesnenin merkez koordinatları: #{@x},#{@y}"
      puts "Nesnenin boyutu: #{BOYUT} Boyutlu"
      puts "Nesnenin alanı: #{alan}"
      puts "Nesnenin hacmi: #{hacim}"
    end
  
    def bilgi_al
      print "#{NAME} kenar uzunluğunu giriniz: "
      @ken_uzu = gets.chomp.to_i
    end
  
    def alan
      @ken_uzu**2
    end
  
    def hacim
      'İki boyutlu şeklin hacmi hesaplanamaz!'
    end
  end
  
  # Yarıçap parametresi alan iki boyutlu ÇEMBER sınıfı
  class Cember < IkiBoyutluSekil
  
    NAME = self.to_s #Şeklin ismini bir değişkende tut
  
    def initialize(x=0, y=0)
      super x, y
    end
  
    def yazdir
      puts "------------------------------------------------"
      puts "Nesnenin şekli: #{NAME}"
      puts "Nesnenin merkez koordinatları: #{@x},#{@y}"
      puts "Nesnenin boyutu: #{BOYUT} Boyutlu"
      puts "Nesnenin alanı: #{alan}"
      puts "Nesnenin hacmi: #{hacim}"
    end
  
    def bilgi_al
      print "#{NAME} yarıçapını giriniz: "
      @yaricap = gets.chomp.to_i
    end
    
    def alan
      Math::PI*(@yaricap**2)
    end
  
    def hacim
      'İki boyutlu şeklin hacmi hesaplanamaz!'
    end
  
  end
  
  # Kenar uzunluğu parametresi alan üç boyutlu KÜP sınıfı
  class Kup < UcBoyutluSekil
    NAME = self.to_s # Şeklin ismini bir değişkende tut
  
    def initialize(x=0, y=0, z=0)
      super x, y, z
    end
  
    def yazdir
      puts "------------------------------------------------"
      puts "Nesnenin şekli: #{NAME}"
      puts "Nesnenin merkez koordinatları: #{@x},#{@y},#{@z}"
      puts "Nesnenin boyutu: #{BOYUT} Boyutlu"
      puts "Nesnenin alanı: #{alan}"
      puts "Nesnenin hacim arttırma miktarı: #{@hac_art}"
      puts "Nesnenin arttırılmış hacmi: #{hacim}"
      puts "Nesnenin ilk hacmi: #{@hacim_ilk}"
    end
  
    def bilgi_al
      print "#{NAME} kenar uzunluğunu giriniz: "
      @ken_uzu = gets.chomp.to_i
      print "#{NAME} hacim arttırma miktarını giriniz: "
      @hac_art = gets.chomp.to_i
    end
  
    def alan
      6 * (@ken_uzu**2)
    end
  
    def hacim
      @hacim_ilk = @ken_uzu**3
      @hacim_son = @hacim_ilk * @hac_art if @hac_art != 0
      @hacim_son
    end
  end
  
  # Yarıçap parametresi alan üç boyutlu KÜRE sınıfı
  class Kure < UcBoyutluSekil
  
    NAME = self.to_s # Şeklin ismini bir değişkende tut
  
    def initialize(x=0, y=0, z=0)
      super x, y, z
    end
  
    def yazdir
      puts "------------------------------------------------"
      puts "Nesnenin şekli: #{NAME}"
      puts "Nesnenin merkez koordinatları: #{@x},#{@y},#{@z}"
      puts "Nesnenin boyutu: #{BOYUT} Boyutlu"
      puts "Nesnenin alanı: #{alan}"
      puts "Nesnenin hacim arttırma miktarı: #{@hac_art}"
      puts "Nesnenin arttırılmış hacmi: #{hacim}"
      puts "Nesnenin ilk hacmi: #{@hacim_ilk}"
    end
  
    def bilgi_al
      print "#{NAME} yarıçapını giriniz: "
      @yaricap = gets.chomp.to_i
      print "#{NAME} hacim arttırma miktarını giriniz: "
      @hac_art = gets.chomp.to_i
    end
  
    def alan
      4 * Math::PI * (@yaricap**2)
    end
  
    def hacim
      @hacim_ilk = (4 / 3) * Math::PI * (@yaricap**3)
      @hacim_son = @hacim_ilk * @hac_art if @hac_art != 0 #Hacim arttırma 0 ise değişmesini istemiyorum
      @hacim_son
    end
  end
  
  def main
  
    loop do #Hatalı değer kontrolü için sonsuz döngü
        puts "Kare --> KARE/kare,"
        puts "Çember --> CEMBER/cember,"
        puts "Küp --> KUP/kup,"
        puts "Küre --> KURE/kure,"
        puts "Çıkış --> CIKIS/cikis,"
        
      print "ŞEKLİ GİRİNİZ: "
      sekil = gets.chomp.to_s
      if sekil == "KARE" || sekil == "kare" || sekil =="CEMBER" || sekil == "cember" || sekil == "KUP" || sekil == "kup" || sekil == "KURE" || sekil =="kure" || sekil =="CIKIS" || sekil == "cikis"
        
        case sekil
        when "KARE" || "kare" 
          print "x koordinatını giriniz: "
          $kor_x = gets.chomp.to_i            #DRY değil global değişken kullanmak zorunda kaldım
          print "y koordinatını giriniz: "
          $kor_y = gets.chomp.to_i
          kare = Kare.new($kor_x, $kor_y)       #Nesneler oluşturuluyor
          kare.bilgi_al
          puts "------------------------------------------------"
          puts "2 boyutlu Kare nesnesi oluşturuldu."
          kare.yazdir
          puts "##################################################"
        when "kare" 
            print "x koordinatını giriniz: "
            $kor_x = gets.chomp.to_i            #DRY değil global değişken kullanmak zorunda kaldım
            print "y koordinatını giriniz: "
            $kor_y = gets.chomp.to_i
            kare = Kare.new($kor_x, $kor_y)       #Nesneler oluşturuluyor 
            kare.bilgi_al
            puts "------------------------------------------------"
            puts "2 boyutlu Kare nesnesi oluşturuldu."
            kare.yazdir
            puts "##################################################"
        when "CEMBER" || "cember"
            print "x koordinatını giriniz: "
          $kor_x = gets.chomp.to_i            #DRY değil global değişken kullanmak zorunda kaldım
          print "y koordinatını giriniz: "
          $kor_y = gets.chomp.to_i
          cember = Cember.new($kor_x, $kor_y)   
          cember.bilgi_al
          puts "------------------------------------------------"
          puts "2 boyutlu Çember nesnesi oluşturuldu."
          cember.yazdir
          puts "##################################################"
        when "cember"
            print "x koordinatını giriniz: "
          $kor_x = gets.chomp.to_i            #DRY değil global değişken kullanmak zorunda kaldım
          print "y koordinatını giriniz: "
          $kor_y = gets.chomp.to_i
          cember = Cember.new($kor_x, $kor_y)   
          cember.bilgi_al
          puts "------------------------------------------------"
          puts "2 boyutlu Çember nesnesi oluşturuldu."
          cember.yazdir
          puts "##################################################"
        when "KUP" 
          print "x koordinatını giriniz: "
          $kor_x = gets.chomp.to_i
          print "y koordinatını giriniz: "
          $kor_y = gets.chomp.to_i
          print "z koordinatını giriniz: "
          $kor_z = gets.chomp.to_i
          kup = Kup.new($kor_x, $kor_y, $kor_z)    #Nesneler oluşturuluyor
          kup.bilgi_al
          puts "------------------------------------------------"
          puts "3 boyutlu Küp nesnesi oluşturuldu."
          kup.yazdir
          puts "##################################################"
        when "kup" 
            print "x koordinatını giriniz: "
            $kor_x = gets.chomp.to_i
            print "y koordinatını giriniz: "
            $kor_y = gets.chomp.to_i
            print "z koordinatını giriniz: "
            $kor_z = gets.chomp.to_i
            kup = Kup.new($kor_x, $kor_y, $kor_z)    #Nesneler oluşturuluyor
            kup.bilgi_al
            puts "------------------------------------------------"
            puts "3 boyutlu Küp nesnesi oluşturuldu."
            kup.yazdir
            puts "##################################################"
        when "KURE" || "kure" 
            print "x koordinatını giriniz: "
            $kor_x = gets.chomp.to_i
            print "y koordinatını giriniz: "
            $kor_y = gets.chomp.to_i
            print "z koordinatını giriniz: "
            $kor_z = gets.chomp.to_i
            kure = Kure.new($kor_x, $kor_y, $kor_z)  
            kure.bilgi_al
            puts "------------------------------------------------"
            puts "3 boyutlu Küre nesnesi oluşturuldu."
            kure.yazdir
            puts "##################################################"
        when "kure" 
            print "x koordinatını giriniz: "
            $kor_x = gets.chomp.to_i
            print "y koordinatını giriniz: "
            $kor_y = gets.chomp.to_i
            print "z koordinatını giriniz: "
            $kor_z = gets.chomp.to_i
            kure = Kure.new($kor_x, $kor_y, $kor_z)  
            kure.bilgi_al
            puts "------------------------------------------------"
            puts "3 boyutlu Küre nesnesi oluşturuldu."
            kure.yazdir
            puts "##################################################"
        when "CIKIS"
            break
        when "cikis"
            break
        end
      else 
        puts "**************************************************"
        puts "Hatalı giriş. Lütfen tekrar deneyin"
        puts "##################################################"
      end
    end
  end

  main
  