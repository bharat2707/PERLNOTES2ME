#Editor to be used to run perl scripts GVIM..If you haven't installed already then install it by 
#Ubuntu 16.04 it should be:
=> sudo apt update
=> sudo apt install vim-gnome

If the above command does not work..Google it for solution and update the document.

#Required PERL modules and how to install it
=> first install cpan..Command being sudo apt-get install cpan
=> Once cpan is installed. Run 
    * sudo cpan
    * Enter sudo password.
    * cpan> install module name
    

#Follow some rules while coding perl
Indentation set to 4 tabs..
Command used in gvim is ':se ts=4'
or set it in .vimrc..Check with us on this..

#set up burp suit / tamper data for link information..This are tools to obtain get/post links used while scraping pages from website.
=>Tamper data is an add on to firefox browser..Google it and install..
If still not able to install contact us.

=>Burp suite installaton procedure:
* It is a jar file..Will share it over slack if you ask for it or download latest free version from 'https://portswigger.net/burp/download.html'
* Setting to be done for it to work:
        => Preferably use firefox browser for it.For other browsers set up google and DIY(DO It Yourself).
        => Run java -jar burpsuite_free_v1.6.01 to open burp then set proxy setting 127.0.0.1 port 8081..
        => Do the same in firefox setting.
        => Then run http://burp/cert download certificate
        => Then add the same in firefox path Preference->Advanced->Certificates->View Certificate-> Import from the downloaded location


