#Here we will see examples of invisible browser I had mentioned in 12.section..Mechanize is the browser name..We will see the use of get and post 
#to obtain website pages page by page..It has all the functionality a browser has but for each of them we have an equivalent names in the module.
#Your reference link for Mechanize will be "http://search.cpan.org/~oalders/WWW-Mechanize-1.83/lib/WWW/Mechanize.pm"..In programming terms known as module
#There are two methods where we can screen-scrap websites page by page.
#get => This method is obtained when you directly hit the link into a browser..Mostly all login pages are get method
#post => when you are required to fill params to get to next page..Any bank website you access will ask you for your username/password for login..There you go these are
#post examples.
#How to use this is shown in below piece of code.
#!/usr/bin/perl
use strict;

use WWW::Mechanize;
use LWP::ConnCache;
use HTTP::Cookies;
use JSON;

autoflush STDOUT 1;

my $cookie_jar = HTTP::Cookies->new;
# Initialize Mechanize
my $mech = WWW::Mechanize->new('ssl_opts' => { 'verify_hostname' => 0 } , cookie_jar => $cookie_jar);
$mech->env_proxy();
$mech->conn_cache( LWP::ConnCache->new() );

$mech->add_header(
    'User-Agent'      => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.1)',
    'Accept'          => '*/*',
    'Accept-Language' => 'en-US',
);

my ($c, $count, $response);

my $username = 'brbharatdj@gmail.com';
my $password = 'falcon123';

my $loginUrl = "https://www.homeshop18.com/login.html";


main();
sleep(2);
exit(0);


sub main {
    #Debug messages help us to debug as the name mentions when reading the output from out files.
    debug_print("Getting Home18 login page");
    #Usage of get method
    $response = $mech->get($loginUrl);
    get_response_content();

    #It is generally a good practise to name variables in camel case or underscore seperated. Variable/Function names to be self explanatory
    #as far as possible.
    debug_print("Posting to get Home page with credentials");
    my $formName = "loginform";
    (defined $mech->form_name($formName)) ? my $form = $mech->form_name($formName) : error_exit("PAGE", "Form $formName not found");
    my @input = ();
    push (@input, "loginId", $username, "password", $password);
    $response = DoMechPost($form,\@input);
    get_response_content();

    
    #Try logging in with incorrect password and provide proper error condition
    
    #Assuming login sucess
    my $clothing_link;
    if ($c =~ />\s*Digital\s*<.*?href\s*\=\s*.(.*?).\s+.*?>\s*Clothing/is) {
        $clothing_link = $1;
    } else {
        error_exit("PAGE", "Clothing link not found.");
    }
    debug_print("Clicking on clothing link");
    $response = $mech->get($clothing_link);
    get_response_content();

    #Similary find a link of your choice scrape discounts or something and display.

    #Logging out of site
    do_logout();
}

sub do_logout {
    my $formId = "logoutForm";
    (defined $mech->form_id($formId)) ? my $form = $mech->form_id($formId) : error_exit("PAGE", "Form $formId not found");
    my @input = ();
    my $csrf = $form->find_input("_csrf");
    debug_print("Logging out from Home18 website");
    push (@input, "_csrf", $csrf);
    $response = DoMechPost($form,\@input);
    get_response_content();
}

sub get_response_content {
    #Count is used to store the pages in html
    $count += 1;
    my $ct = $mech->ct;
    my $k_status_line = $response->status_line;
    my $k_url_base    = $response->base;
    #Webpage content is stored using below code.
    $c = $response->decoded_content();
    $c = $response->content() if(!$c);
    error_exit("Page neither encoded nor decoded") if(!$c);
    #Below messages are self explanatory
    debug_print("Status Line: $k_status_line");
    debug_print("Content Type: $ct");
    debug_print("Base: $k_url_base");
    
    $response->is_info ? debug_print("is_info: yes") : debug_print("is_info: no");
    $response->is_success ?  debug_print("is_success: yes") : debug_print("is_success: no");
    $response->is_redirect ?  debug_print("is_redirect: yes") : debug_print("is_redirect: no");
    $response->is_error ?  debug_print("is_error: yes") : debug_print("is_error: no");
    
    #Cookies are set.
    my $k_cookies = $mech->cookie_jar->as_string;
    debug_print($k_cookies);
    #HTML/or any page obtained from the website we are trying to access are stored by using below function.
    dump_file( $c, "output" );
    
    #Status line is an indicator if the get/post we do is successful or not.
    #200 is correct
    #302 means redirection
    #404 something on our end is not correct
    #500 means there is a server error (meaning the website we are trying to access is down mostly.)
    #Below code catches errors mentioned above.
    error_exit("Unable to fetch url#$count. Status: " . $response->status_line ) if ($response->is_error);
}

sub DoMechPost {
    my $formObject  = shift;        # HTML Form Object that Mech Object is pointing to
    my $inputFields = shift;        # Array Reference containing key-Value pairs non-hidden fields
    my $action      = shift;

    #If action is not passed action is set
    $action = $formObject->action if (!$action);
    debug_print("Action is $action and submitting form now");
    #It finds all the hidden params so that only non hidden params can be passed.
    my @htmlInputObjects = $mech->find_all_inputs();
    my $inputObj;
    my $ctr = 0;

    for (my $j =0; $j<scalar(@htmlInputObjects);$j++) {
        $inputObj = $htmlInputObjects[$j];
        for (my $i = 0;$i < scalar(@$inputFields);$i++) {
            if ($inputObj->name eq @$inputFields[$i]) {
                $ctr = 0;
                last;
                $i++;
            } else {
                $ctr = 1;
            }
            $i++;
        }
        if ($inputObj->type eq "hidden" && $ctr) {
            push (@$inputFields,$inputObj->name,$inputObj->value);
        }
    }
    #Posting is done as explained earlier.
    return $mech->post($action,$inputFields); # $inputFields us array reference
}

sub error_exit {
    my $message  = shift;
    print "#ERROR $message\n";

    sleep(2);
    exit(0);
}

sub dump_file {
    my $local_c  = shift;
    my $prefix   = shift;
    my $filename = $prefix . $count . ".html";
    open( OUTFILE, ">$filename" ) or error_exit("Can't open $filename: $!" );
    #Generally it is a good practise to store in binary output.Figure out why and update here.
    binmode(OUTFILE);
    print OUTFILE $local_c;
    close OUTFILE;
    debug_print("Response dumped in file $filename");
}



sub debug_print {
    my $message = shift;
    print "KFetcher: $message\n";
}


