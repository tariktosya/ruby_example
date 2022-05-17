class Omurgalilar
    def ye
        puts "Yemek Yiyor"
    end
    def ic
        puts "Su Iciyor"
    end
    def uyu
        puts "uyuyor"
    end
end
class Hareket
    attr_accessor :surun, :adim, :uc
    def initialize(surun,adim,uc)
        @surun=surun
        @adim=adim
        @uc=uc
    end
    def getSurun
        puts "#{@surun}"
    end
    def getadim
        puts "#{@adim}"
    end
    def getuc
        puts "#{@uc}"
    end
end

class Insan < Omurgalilar
    attr_accessor :adim
    def initialize(adim)
        @adim=adim
    end
    def adim
        puts "#{@adim}"
    end
    def ye
        super
    end
    def ic
        super
    end
    def uyu
        super
    end
end
class Kus < Omurgalilar
    attr_accessor :uc
    def initialize(uc)
        @uc=uc
    end
    def uc
        puts "#{@uc}"
    end
    def ye
        super
    end
    def ic
        super
    end
    def uyu
        super
    end
end
class Timsah < Omurgalilar
    attr_accessor :surun
    def initialize(surun)
        @surun=surun
    end
    def surun
        puts "#{@surun}"
    end
    def ye
        super
    end
    def ic
        super
    end
    def uyu
        super
    end
end

def main
    fb = Hareket.new("Surunuyor","Adim Atiyor","ucuyor")
    puts "***INSAN***"
    insan = Insan.new(fb.adim)
    insan.ye
    insan.ic
    insan.uyu
    insan.adim

    puts "***KUS***"
    kus = Kus.new(fb.uc)
    kus.ye
    kus.ic
    kus.uyu
    kus.uc

    puts "***TIMSAH***"
    timsah = Timsah.new(fb.surun)
    timsah.ye
    timsah.ic
    timsah.uyu
    timsah.surun

end
main.main