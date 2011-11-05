require 'formula'

class Lftp < Formula
  url 'http://ftp.yar.ru/pub/source/lftp/lftp-4.3.3.tar.gz'
  homepage 'http://lftp.yar.ru/'
  md5 '14bd2e4a583d07593d76da3690aef02a'

  depends_on 'pkg-config' => :build
  depends_on 'readline'
  depends_on 'gnutls'

  def install
    # Bus error
    ENV.no_optimization if MacOS.leopard?

    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
