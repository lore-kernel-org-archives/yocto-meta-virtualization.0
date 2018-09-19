Return-Path: <warrenphd@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B363E00A4F; Tue, 18 Sep 2018 19:00:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	MIME_QP_LONG_LINE, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (warrenphd[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97552E0095C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 19:00:33 -0700 (PDT)
Received: by mail-oi0-f50.google.com with SMTP id t68-v6so3612656oie.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 19:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:date:subject:message-id
	:to; bh=Ep3bDNvdSNWhKXVWGjOSPDIe7h9as0yfUihg8EuPyRc=;
	b=BKd5DC0oc4C5/e9OYXhn90kBLGN04R4+g1YONK+U10pyEMDL6XKPpdwsHjdHTyGGtE
	eb8phiIa0EQHAOnbjvbHQyX1iKn+lTUYyHJPuhqIeiz8BYWFAflaUYWVfnGJuXMLey1n
	XFCBnwJ3PN+I5+D5/Q/b6R/y1UMpUXiDs6s2u0M3gcF5jG6ogpqfpECNCaryYPQrXAal
	gjGS+fXqZIHUdE+KHJ3811J1+QyVO6ZJbDOxWa3u2WmSl6toP8Jzg0Qfc6Lp4V7dUpZD
	qSbbvrAwjLQ9OTS/SPRdQAcGhScU+mTZZd4fex8D0KGOCII3UuR4y3hBNF0QVhdcuO5G
	IfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
	:subject:message-id:to;
	bh=Ep3bDNvdSNWhKXVWGjOSPDIe7h9as0yfUihg8EuPyRc=;
	b=nK9VsAKVNlZpDzIAZ43rGXP3uZCrJlk2Dl5EDUHWO6fUbEcHka4SRPNzCgql55S2wN
	plpwf0oX6w35xWGDQjgsLnkkONF4Gpj6T4PQLPoZ2LAX0IkQ0asyCq8gcY8X7V46gaB7
	rqZBgBArsnRTttyflspLdw9v5RJmzsJZ2IM4GTpPb4EDLw3MKi0svILLz9KyE1Fm8Yxf
	0842UgiD6V9JfOxMBfvHLsMylE8jj+uuTcgSZVl3YfShgHPwL6C4EjLj3fQ7UdE6Sg8N
	TD16T75VVdkwd4eVmy+Yid93Q+ZtIaNE2Qz5HfGV63TZdS7dAlB2xC4gDUO9FsWBFEJg
	h68w==
X-Gm-Message-State: APzg51Ba5oHzpkUjizn+dfmwIsDaLR4FNwvj/4nHZJ0+kzcJUSR0HjLE
	jTkYpLxOR5Sgn4XGY0mkqQX77ncv
X-Google-Smtp-Source: ANB0VdYVx8Qvfq/s2d2E/PqV5TVEtf6aIdHdH+e3CKwgse88TJUMivW5O0aJW4vj7mxj9zPwCQGEjA==
X-Received: by 2002:aca:c0c1:: with SMTP id
	q184-v6mr277577oif.61.1537322432844; 
	Tue, 18 Sep 2018 19:00:32 -0700 (PDT)
Received: from [10.0.1.248] (c-68-59-83-200.hsd1.fl.comcast.net.
	[68.59.83.200]) by smtp.gmail.com with ESMTPSA id
	j125-v6sm10870624oih.53.2018.09.18.19.00.31
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 19:00:32 -0700 (PDT)
From: Phillip Warren <warrenphd@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 18 Sep 2018 21:00:31 -0500
Message-Id: <A6954388-BBBA-4BD1-88DE-45DB7D49D3CB@gmail.com>
To: meta-virtualization@yoctoproject.org
X-Mailer: iPhone Mail (15G77)
Subject: Adding SSL support to RabbitMQ Server 3.2.4
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 02:00:34 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-B2F7D155-ADE2-476A-8B94-79C109373011
Content-Transfer-Encoding: 7bit

--Apple-Mail-B2F7D155-ADE2-476A-8B94-79C109373011
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Multipost from [yocto] as I just realized [meta-virtualization] is probably t=
he proper list for this question.

Hi, rookie here. I'm trying to enable SSL for Management Plugin for RabbitMQ=
 Server 3.2.4 on pyro.

Without modifying the build, I simply created /etc/rabbitmq/rabbitmq.config w=
ith the following entries:

[
  {rabbitmq_management,
  [
    {listener, [{port,     15671},
                {ip,       "0.0.0.0"},
                {ssl,      true},
                {ssl_opts, [{cacertfile, "/etc/rabbitmq/root-ca.pem"},
                            {certfile,   "/etc/rabbitmq/dev.pem"},
                            {keyfile,    "/etc/rabbitmq/dev-np.key"}]}]}
  ]}
].

and placed the cacertfile, certfile, and keyfile at /etc/rabbitmq/

RabbitMQ Server fails to start at boot. /var/log/rabbitmq/rabbitmq@{hostname=
}.log shows the following error:

=3DERROR REPORT=3D=3D=3D=3D 17-Sep-2018::20:13:16 =3D=3D=3D
** Generic server rabbit_web_dispatch_registry terminating=20
** Last message in was {add,rabbit_mgmt,
                           [{port,15671},
                            {ip,"0.0.0.0"},
                            {ssl,true},
                            {ssl_opts,
                                [{cacertfile,"/etc/rabbitmq/root-ca.pem"},
                                 {certfile,"/etc/rabbitmq/dcx-dev.pem"},
                                 {keyfile,"/etc/rabbitmq/dcx-dev-np.key"}]}]=
,
                           #Fun<rabbit_web_dispatch.1.73001898>,
                           #Fun<rabbit_mgmt_app.2.77843060>,
                           {[],"RabbitMQ Management"}}
** When Server state =3D=3D undefined
** Reason for termination =3D=3D=20
** {could_not_start_listener,
       [{port,15671},
        {ip,"0.0.0.0"},
        {ssl,true},
        {ssl_opts,
            [{cacertfile,"/etc/rabbitmq/root-ca.pem"},
             {certfile,"/etc/rabbitmq/dcx-dev.pem"},
             {keyfile,"/etc/rabbitmq/dcx-dev-np.key"}]}],
       {'EXIT',
           {{case_clause,{error,{"no such file or directory","crypto.app"}}}=
,
            [{mochiweb,ensure_started,1,
                 [{file,"mochiweb-wrapper/mochiweb-git/src/mochiweb.erl"},
                  {line,71}]},
             {mochiweb_socket_server,prep_ssl,1,
                 [{file,
                      "mochiweb-wrapper/mochiweb-git/src/mochiweb_socket_ser=
ver.erl"},
                  {line,139}]},
             {mochiweb_socket_server,start_server,2,
                 [{file,
                      "mochiweb-wrapper/mochiweb-git/src/mochiweb_socket_ser=
ver.erl"},
                  {line,130}]},
             {supervisor,do_start_child,2,
                 [{file,"supervisor.erl"},{line,310}]},
             {supervisor,handle_start_child,2,
                 [{file,"supervisor.erl"},{line,681}]},
             {supervisor,handle_call,3,[{file,"supervisor.erl"},{line,390}]}=
,
             {gen_server,handle_msg,5,[{file,"gen_server.erl"},{line,585}]},=

             {proc_lib,init_p_do_apply,3,
                 [{file,"proc_lib.erl"},{line,239}]}]}}}

After googling around, I'm going down the path of trying to build Erlang wit=
h SSL support. Please stop me if this isn't the proper approach!

I clearly see in meta-cloud-services/meta-openstack/recipes-devtools/erlang/=
erlang-native_R16B03-1.bb a line that says:

EXTRA_OECONF =3D '--without-ssl'

To alter this statement, I wrote an erlang-native_R16B03-1.bbappend in my me=
ta-layer and tried the following entries:

****************************************************************************=
*************************

DEPENDS +=3D "ncurses-native openssl"
EXTRA_OECONF =3D '--with-ssl=3D/usr/bin/openssl'

This fails to build with the following error:

configure: error: Invalid path to option --with-ssl=3DPATH
configure: error: /bin/bash 'build/tmp/work/x86_64-linux/erlang-native/R16B0=
3-1-r0/otp_src_R16B03-1/erts/configure' failed for erts

****************************************************************************=
*************************

DEPENDS +=3D "ncurses-native openssl"
EXTRA_OECONF =3D '--with-ssl'

Builds successfully but produces the same error as above in /var/log/rabbitm=
q/rabbitmq@{hostname}.log
****************************************************************************=
*************************

DEPENDS +=3D "ncurses-native openssl"
EXTRA_OECONF =3D "--with-ssl=3D${STAGING_DIR_HOST}${layout_exec_prefix}"

Builds successfully but produces the same error as above in /var/log/rabbitm=
q/rabbitmq@{hostname}.log
****************************************************************************=
*************************

DEPENDS +=3D "ncurses-native openssl"
EXTRA_OECONF =3D  "--with-ssl use SSL"

Builds successfully but produces the same error as above in /var/log/rabbitm=
q/rabbitmq@{hostname}.log
****************************************************************************=
*************************

Detailed help is greatly appreciated. Seems like I'm missing something obvio=
us.

Best Regards,
Phillip Warren=

--Apple-Mail-B2F7D155-ADE2-476A-8B94-79C109373011
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><span style=3D"background-color: rgba(255, 2=
55, 255, 0);">Multipost from [yocto] as I just realized [meta-virtualization=
] is probably the proper list for this question.</span><div><span style=3D"b=
ackground-color: rgba(255, 255, 255, 0);"><br></span><div dir=3D"ltr"><font s=
tyle=3D"background-color: rgba(255, 255, 255, 0);">Hi, rookie here. I'm tryi=
ng to enable SSL for Management Plugin for RabbitMQ Server 3.2.4 on pyro.</f=
ont></div><div dir=3D"ltr"><span style=3D"background-color: rgba(255, 255, 2=
55, 0);"><br></span></div><div dir=3D"ltr"><font style=3D"background-color: r=
gba(255, 255, 255, 0);">Without modifying the build, I simply created /etc/r=
abbitmq/rabbitmq.config with the following entries:</font><div><span style=3D=
"background-color: rgba(255, 255, 255, 0);"><br></span></div><div><p class=3D=
"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-variant-=
east-asian: normal; font-stretch: normal; line-height: normal;"><span style=3D=
"background-color: rgba(255, 255, 255, 0);">[</span></p><p class=3D"gmail-p1=
" style=3D"margin: 0px; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-stretch: normal; line-height: normal;"><span style=3D"backgr=
ound-color: rgba(255, 255, 255, 0);"><span class=3D"gmail-Apple-converted-sp=
ace">&nbsp;&nbsp;</span>{rabbitmq_management,</span></p><p class=3D"gmail-p1=
" style=3D"margin: 0px; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-stretch: normal; line-height: normal;"><span style=3D"backgr=
ound-color: rgba(255, 255, 255, 0);"><span class=3D"gmail-Apple-converted-sp=
ace">&nbsp;&nbsp;</span>[</span></p><p class=3D"gmail-p1" style=3D"margin: 0=
px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stre=
tch: normal; line-height: normal;"><span style=3D"background-color: rgba(255=
, 255, 255, 0);"><span class=3D"gmail-Apple-converted-space">&nbsp; &nbsp;&n=
bsp;</span>{listener, [{port,&nbsp;<span class=3D"gmail-Apple-converted-spac=
e">&nbsp; &nbsp;&nbsp;</span><a href=3D"tel:15671" dir=3D"ltr" x-apple-data-=
detectors=3D"true" x-apple-data-detectors-type=3D"telephone" x-apple-data-de=
tectors-result=3D"0">15671</a>},</span></p><p class=3D"gmail-p1" style=3D"ma=
rgin: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-stretch: normal; line-height: normal;"><span style=3D"background-color: r=
gba(255, 255, 255, 0);"><span class=3D"gmail-Apple-converted-space">&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>{ip,&nbsp;<span c=
lass=3D"gmail-Apple-converted-space">&nbsp; &nbsp; &nbsp;&nbsp;</span>"0.0.0=
.0"},</span></p><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-num=
eric: normal; font-variant-east-asian: normal; font-stretch: normal; line-he=
ight: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);"><sp=
an class=3D"gmail-Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;&nbsp;</span>{ssl,<span class=3D"gmail-Apple-converted-sp=
ace">&nbsp; &nbsp; &nbsp;&nbsp;</span>true},</span></p><p class=3D"gmail-p1"=
 style=3D"margin: 0px; font-variant-numeric: normal; font-variant-east-asian=
: normal; font-stretch: normal; line-height: normal;"><span style=3D"backgro=
und-color: rgba(255, 255, 255, 0);"><span class=3D"gmail-Apple-converted-spa=
ce">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>{ssl=
_opts, [{cacertfile, "/etc/rabbitmq/root-ca.pem"},</span></p><p class=3D"gma=
il-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-variant-east=
-asian: normal; font-stretch: normal; line-height: normal;"><span style=3D"b=
ackground-color: rgba(255, 255, 255, 0);"><span class=3D"gmail-Apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>{certfile,&nbsp;<span class=3D"g=
mail-Apple-converted-space">&nbsp;&nbsp;</span>"/etc/rabbitmq/dev.pem"},</sp=
an></p><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: nor=
mal; font-variant-east-asian: normal; font-stretch: normal; line-height: nor=
mal;"><span style=3D"background-color: rgba(255, 255, 255, 0);"><span class=3D=
"gmail-Apple-converted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>{keyfile,<sp=
an class=3D"gmail-Apple-converted-space">&nbsp; &nbsp;&nbsp;</span>"/etc/rab=
bitmq/dev-np.key"}]}]}</span></p><p class=3D"gmail-p1" style=3D"margin: 0px;=
 font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch=
: normal; line-height: normal;"><span style=3D"background-color: rgba(255, 2=
55, 255, 0);"><span class=3D"gmail-Apple-converted-space">&nbsp;&nbsp;</span=
>]}</span></p><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-numer=
ic: normal; font-variant-east-asian: normal; font-stretch: normal; line-heig=
ht: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);">].</s=
pan></p><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: no=
rmal; font-variant-east-asian: normal; font-stretch: normal; line-height: no=
rmal;"><span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span>=
</p><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal=
; font-variant-east-asian: normal; font-stretch: normal; line-height: normal=
;"><span style=3D"background-color: rgba(255, 255, 255, 0);">and placed the&=
nbsp;cacertfile, certfile, and keyfile&nbsp;at /etc/rabbitmq/</span></p><p c=
lass=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; font-stretch: normal; line-height: normal;"><span=
 style=3D"background-color: rgba(255, 255, 255, 0);"><br></span></p><p class=
=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; font-stretch: normal; line-height: normal;"><span sty=
le=3D"background-color: rgba(255, 255, 255, 0);">RabbitMQ Server fails to st=
art at boot. /var/log/rabbitmq/rabbitmq@{hostname}.log shows the following e=
rror:</span></p><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-num=
eric: normal; font-variant-east-asian: normal; font-stretch: normal; line-he=
ight: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);"><br=
></span></p><div><div><span style=3D"background-color: rgba(255, 255, 255, 0=
);">=3DERROR REPORT=3D=3D=3D=3D 17-Sep-2018::20:13:16 =3D=3D=3D</span></div>=
<div><span style=3D"background-color: rgba(255, 255, 255, 0);">** Generic se=
rver rabbit_web_dispatch_registry terminating&nbsp;</span></div><div><span s=
tyle=3D"background-color: rgba(255, 255, 255, 0);">** Last message in was {a=
dd,rabbit_mgmt,</span></div><div><span style=3D"background-color: rgba(255, 2=
55, 255, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[{port,<a href=3D"tel:15671" dir=3D"ltr" x=
-apple-data-detectors=3D"true" x-apple-data-detectors-type=3D"telephone" x-a=
pple-data-detectors-result=3D"3">15671</a>},</span></div><div><span style=3D=
"background-color: rgba(255, 255, 255, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {ip,"0.0.0=
.0"},</span></div><div><span style=3D"background-color: rgba(255, 255, 255, 0=
);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; {ssl,true},</span></div><div><span style=3D"backgr=
ound-color: rgba(255, 255, 255, 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {ssl_opts,</span>=
</div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; [{cacertfile,"/etc/rabbitmq/root-ca.pem"},</span>=
</div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{certfile,"/etc/rabbitmq/dcx-dev.pem"},</sp=
an></div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{keyfile,"/etc/rabbitmq/dcx-dev-np.key=
"}]}],</span></div><div><span style=3D"background-color: rgba(255, 255, 255,=
 0);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;#Fun&lt;rabbit_web_dispatch.1.73001898&gt;,</span>=
</div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;#Fun&lt;rabbit_mgmt_app.2.77843060&gt;,</span></div><div><span s=
tyle=3D"background-color: rgba(255, 255, 255, 0);">&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{[],=
"RabbitMQ Management"}}</span></div></div><span style=3D"background-color: r=
gba(255, 255, 255, 0);">** When Server state =3D=3D undefined<br>** Reason f=
or termination =3D=3D&nbsp;<br>** {could_not_start_listener,<br>&nbsp; &nbsp=
; &nbsp; &nbsp;[{port,<a href=3D"tel:15671" dir=3D"ltr" x-apple-data-detecto=
rs=3D"true" x-apple-data-detectors-type=3D"telephone" x-apple-data-detectors=
-result=3D"5">15671</a>},<br>&nbsp; &nbsp; &nbsp; &nbsp; {ip,"0.0.0.0"},<br>=
&nbsp; &nbsp; &nbsp; &nbsp; {ssl,true},<br>&nbsp; &nbsp; &nbsp; &nbsp; {ssl_=
opts,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [{cacertfile,"/etc/rabbit=
mq/root-ca.pem"},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{certfi=
le,"/etc/rabbitmq/dcx-dev.pem"},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;{keyfile,"/etc/rabbitmq/dcx-dev-np.key"}]}],<br>&nbsp; &nbsp; &nbsp;=
 &nbsp;{'EXIT',<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{{case_clause,{e=
rror,{"no such file or directory","crypto.app"}}},<br>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; [{mochiweb,ensure_started,1,<br>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[{file,"mochiweb-wrapper/mochiweb-git/=
src/mochiweb.erl"},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; {line,71}]},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{m=
ochiweb_socket_server,prep_ssl,1,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[{file,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "mochiweb-wrapper/mochiweb-git/src/mochiwe=
b_socket_server.erl"},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; {line,139}]},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;{mochiweb_socket_server,start_server,2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;[{file,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "mochiweb-wrapper/mochiweb-git/sr=
c/mochiweb_socket_server.erl"},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; {line,130}]},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;{supervisor,do_start_child,2,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;[{file,"supervisor.erl"},{line,310}]},<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{supervisor,handle_start_child,2=
,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[{file,"s=
upervisor.erl"},{line,681}]},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;{supervisor,handle_call,3,[{file,"supervisor.erl"},{line,390}]},<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{gen_server,handle_msg,5,[{file=
,"gen_server.erl"},{line,585}]},<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;{proc_lib,init_p_do_apply,3,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;[{file,"proc_lib.erl"},{line,239}]}]}}}</span></di=
v><div><span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span>=
</div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">After g=
oogling around,&nbsp;I'm going down the path of trying to build Erlang with S=
SL support. Please stop me if this isn't the proper approach!</span></div><d=
iv><span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span></di=
v><div><span style=3D"background-color: rgba(255, 255, 255, 0);">I clearly s=
ee in meta-cloud-services/meta-openstack/recipes-devtools/erlang/erlang-nati=
ve_R16B03-1.bb a line that says:</span></div><div><span style=3D"background-=
color: rgba(255, 255, 255, 0);"><br></span></div><div><p class=3D"gmail-p1" s=
tyle=3D"margin: 0px; font-variant-numeric: normal; font-variant-east-asian: n=
ormal; font-stretch: normal; line-height: normal;"><span style=3D"background=
-color: rgba(255, 255, 255, 0);">EXTRA_OECONF =3D '--without-ssl'</span></p>=
<p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; fo=
nt-variant-east-asian: normal; font-stretch: normal; line-height: normal;"><=
span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span></p><p c=
lass=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; font-stretch: normal; line-height: normal;"><span=
 style=3D"background-color: rgba(255, 255, 255, 0);">To alter&nbsp;this stat=
ement, I wrote an&nbsp;erlang-native_R16B03-1.bbappend in my meta-layer and t=
ried the following&nbsp;entries:</span></p></div><div><span style=3D"backgro=
und-color: rgba(255, 255, 255, 0);"><br class=3D"gmail-Apple-interchange-new=
line">**********************************************************************=
*******************************<br></span></div><div><span style=3D"backgrou=
nd-color: rgba(255, 255, 255, 0);"><br></span></div><div><span style=3D"back=
ground-color: rgba(255, 255, 255, 0);">DEPENDS&nbsp;+=3D "ncurses-native ope=
nssl"</span></div><div><span style=3D"background-color: rgba(255, 255, 255, 0=
);">EXTRA_OECONF =3D '--with-ssl=3D/usr/bin/openssl'</span></div><div><div><=
span style=3D"background-color: rgba(255, 255, 255, 0);"><br class=3D"gmail-=
Apple-interchange-newline">This fails to build with the following error:</sp=
an></div><div><span style=3D"background-color: rgba(255, 255, 255, 0);"><br>=
</span></div><div><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-n=
umeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-=
height: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);">c=
onfigure: error: Invalid path to option --with-ssl=3DPATH</span></p><p class=
=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; font-stretch: normal; line-height: normal;"><span sty=
le=3D"background-color: rgba(255, 255, 255, 0);">configure: error: /bin/bash=
 'build/tmp/work/x86_64-linux/erlang-native/R16B03-1-r0/otp_src_R16B03-1/ert=
s/configure' failed for erts</span></p><p class=3D"gmail-p1" style=3D"margin=
: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-s=
tretch: normal; line-height: normal;"><span style=3D"background-color: rgba(=
255, 255, 255, 0);"><br></span></p><p class=3D"gmail-p1" style=3D"margin: 0p=
x; font-variant-numeric: normal; font-variant-east-asian: normal; font-stret=
ch: normal; line-height: normal;"><span style=3D"background-color: rgba(255,=
 255, 255, 0);">************************************************************=
*****************************************</span></p></div></div><div><span s=
tyle=3D"background-color: rgba(255, 255, 255, 0);"><br></span></div><div><di=
v><span style=3D"background-color: rgba(255, 255, 255, 0);">DEPENDS&nbsp;+=3D=
 "ncurses-native openssl"</span></div><div><span style=3D"background-color: r=
gba(255, 255, 255, 0);">EXTRA_OECONF =3D '--with-ssl'</span></div></div><div=
><p class=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; font-stretch: normal; line-height: normal;">=
<span style=3D"background-color: rgba(255, 255, 255, 0);"><br class=3D"gmail=
-Apple-interchange-newline">Builds successfully but produces the same error a=
s above in&nbsp;/var/log/rabbitmq/rabbitmq@{hostname}.log<br></span></p><p c=
lass=3D"gmail-p1" style=3D"margin: 0px; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; font-stretch: normal; line-height: normal;"><span=
 style=3D"background-color: rgba(255, 255, 255, 0);">***********************=
****************************************************************************=
**<br></span></p></div><div><span style=3D"background-color: rgba(255, 255, 2=
55, 0);"><br></span></div><div><div><span style=3D"background-color: rgba(25=
5, 255, 255, 0);">DEPENDS&nbsp;+=3D "ncurses-native openssl"</span></div><di=
v><span style=3D"background-color: rgba(255, 255, 255, 0);">EXTRA_OECONF =3D=
 "--with-ssl=3D${STAGING_DIR_HOST}${layout_exec_prefix}"</span></div><div><s=
pan style=3D"background-color: rgba(255, 255, 255, 0);"><br class=3D"gmail-A=
pple-interchange-newline">Builds successfully but produces the same error as=
 above in&nbsp;/var/log/rabbitmq/rabbitmq@{hostname}.log<br></span></div></d=
iv><div><span style=3D"background-color: rgba(255, 255, 255, 0);">**********=
****************************************************************************=
***************</span></div><div><span style=3D"background-color: rgba(255, 2=
55, 255, 0);"><br></span><div><span style=3D"background-color: rgba(255, 255=
, 255, 0);">DEPENDS&nbsp;+=3D "ncurses-native openssl"</span></div><span sty=
le=3D"background-color: rgba(255, 255, 255, 0);">EXTRA_OECONF =3D&nbsp; "--w=
ith-ssl use SSL"</span></div><div><span style=3D"background-color: rgba(255,=
 255, 255, 0);"><br></span></div><div><span style=3D"background-color: rgba(=
255, 255, 255, 0);">Builds successfully but produces the same error as above=
 in&nbsp;/var/log/rabbitmq/rabbitmq@{hostname}.log</span></div><div><span st=
yle=3D"background-color: rgba(255, 255, 255, 0);">**************************=
***************************************************************************<=
br></span></div><div><span style=3D"background-color: rgba(255, 255, 255, 0)=
;"><br></span></div><div><font style=3D"background-color: rgba(255, 255, 255=
, 0);">Detailed help is greatly appreciated. Seems like I'm missing somethin=
g obvious.</font></div></div></div><br><div><div><span class=3D"Apple-style-=
span" style=3D"-webkit-tap-highlight-color: rgba(26, 26, 26, 0.294118);">Bes=
t Regards,</span></div><div>Phillip Warren</div></div></body></html>=

--Apple-Mail-B2F7D155-ADE2-476A-8B94-79C109373011--
