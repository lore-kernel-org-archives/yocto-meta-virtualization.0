Return-Path: <yan.yankovskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6632E00D0D; Mon,  6 Nov 2017 01:54:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.128.178 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD1EBE00CF7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 01:54:01 -0800 (PST)
Received: by mail-wr0-f178.google.com with SMTP id 4so3744044wrt.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u8Yaf/K5x39Ab+020TFAcSq+NiB+q/JNJmmZFBhJK7g=;
	b=VCbTA4ekWlAX5w48V5zFUUG0nT5Xde9rxq3cGd5DwN2TPXxhLJ9S00HlUnbhvsKg5O
	318GJwRVJrj/fOrKa121m5G/abctwBuRhO3hR+YcEYDeQaDWyk4cev0zcc9qSxGxUIUK
	3E6elK4cGMWTr+RwK4W51YQt8cDQv5dRd7qiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u8Yaf/K5x39Ab+020TFAcSq+NiB+q/JNJmmZFBhJK7g=;
	b=FK//xBMJGgiF6y9sBJsGzF4Vzd1RvWcphxIyPGlmDqc8+01xUHsvbzy0FfpgDsBDsj
	N+VMyrbedevrAZxtEDKqqkF7zjy1xDfswmR01FUC+dSL0qcU0r8f5VOSomBYOOWH0qXV
	O0sufMW/3UNRsM+enbHgKXhtmX5Phnis4XMLyrUuhRYQ9ablvhoKHdIDPHpakzDKrK37
	NWWZ7W0vhx/gv/Ua7bU73C/ytJVtb+zUps8TcGkuJtBwT9K/gmOu6IR+6sLa/5zWdRtg
	BmXoZ2M6Id1VqCQNz++iHQlMy7D7Bq59w+BznRTdFIsdL9B0jAGCTCTXKF9QSvxl4XFK
	NkTg==
X-Gm-Message-State: AMCzsaUwCW6tqwWsOG6NwvzWkoPI54b0oNmE/X/NHvCZKHACZxjf6A3Q
	+72XwBg/7xrtuZi9pZ4CUIK9ZZ8h6Iq0SvuPHBq1WOVT
X-Google-Smtp-Source: ABhQp+SCBzTLBhL69v7vIocEU7Gq7DIdF+67JIVYDnXIBXgwFoOR6iNXQSOZWIpntt8Lz4pb3hjzkUZ1kRMKtNGji7I=
X-Received: by 10.223.195.200 with SMTP id d8mr12418003wrg.54.1509962040312;
	Mon, 06 Nov 2017 01:54:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.182.139 with HTTP; Mon, 6 Nov 2017 01:53:59 -0800 (PST)
In-Reply-To: <9D17CA0E2F3FD24582A90F5363602C23011EB48C4E@ALA-MBC.corp.ad.wrs.com>
References: <1504083795-20546-1-git-send-email-yan.yankovskyi@globallogic.com>
	<9D17CA0E2F3FD24582A90F5363602C23011EB48C4E@ALA-MBC.corp.ad.wrs.com>
From: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
Date: Mon, 6 Nov 2017 10:53:59 +0100
Message-ID: <CAPaNuAu0Hxk8XU=nB94zMQ7S9Gv=ThhQj4HJNNsjF3yFDArW9w@mail.gmail.com>
To: "Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Mon, 06 Nov 2017 09:54:02 -0000
Content-Type: multipart/alternative; boundary="089e0828102809a37e055d4d6ffa"

--089e0828102809a37e055d4d6ffa
Content-Type: text/plain; charset="UTF-8"

Hi Wei

Unfortunately, I haven't got any response about that. I'm not the only one
who experienced such problem, even among my friends. Another solution might
be to create custom bbappend with the following content:

FILES_${PN}-xencommons_remove = "xenstored.socket xenstored_ro.socket"
SYSTEMD_SERVICE_${PN}-xencommons_remove = "xenstored.socket
xenstored_ro.socket"

(haven't checked it), but I don't understand what are these lines in
xen.inc for?

On Mon, Nov 6, 2017 at 10:45 AM, Wei, Yunguo (Bryan) <
Yunguo.Wei@windriver.com> wrote:

> Hi Yan
>
> Do you know why this patch was not merged? I'm running into same problem.
>
> Regards,
> Yunguo
>
> -----Original Message-----
> From: meta-virtualization-bounces@yoctoproject.org [mailto:
> meta-virtualization-bounces@yoctoproject.org] On Behalf Of Yan Yankovskyi
> Sent: Wednesday, August 30, 2017 5:03 PM
> To: meta-virtualization@yoctoproject.org
> Subject: [meta-virtualization] [PATCH] xen: delete references to
> xenstored.socket and xenstored_ro.socket in xen.inc
>
> These files were removed since the following patch
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=
> 976ce01e103fc03bb3336cdbc6c951a709e285fe
> and are absent in xen 4.8.0 and further, which leads to the following
> error during the Xen build process:
> do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not
> exist
>
> Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
> ---
>  recipes-extended/xen/xen.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index b5c5f03..717424b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -687,8 +687,6 @@ FILES_${PN}-xencommons += "\
>      ${systemd_unitdir}/system/xenconsoled.service \
>      ${systemd_unitdir}/system/xen-init-dom0.service \
>      ${systemd_unitdir}/system/xenstored.service \
> -    ${systemd_unitdir}/system/xenstored.socket \
> -    ${systemd_unitdir}/system/xenstored_ro.socket \
>      ${systemd_unitdir}/system/var-lib-xenstored.mount \
>      "
>
> @@ -728,8 +726,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
>      xenconsoled.service \
>      xen-init-dom0.service \
>      xenstored.service \
> -    xenstored.socket \
> -    xenstored_ro.socket \
>      "
>  SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
Best regards,

Yan Yankovskyi | Associate Software Engineer, Ukraine
GlobalLogic
M  +380.95.049.64.73 <+380950496473>   Skype huandesale

www.globallogic.com

http://www.globallogic.com/email_disclaimer.txt

--089e0828102809a37e055d4d6ffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Wei<br><br></div>Unfortunately, I haven&=
#39;t got any response about that. I&#39;m not the only one who experienced=
 such problem, even among my friends. Another solution might be to create c=
ustom bbappend with the following content:</div><div><br></div><div><span s=
tyle=3D"color:rgb(0,0,255)">FILES_${PN}-xencommons_remove =3D &quot;xenstor=
ed.socket xenstored_ro.socket&quot;</span><br></div><span style=3D"color:rg=
b(0,0,255)">SYSTEMD_SERVICE_${PN}-</span><wbr><span style=3D"color:rgb(0,0,=
255)">xencommons_remove =3D &quot;xenstored.socket xenstored_ro.socket&quot=
;</span></div><div><span style=3D"color:rgb(0,0,255)"></span><br></div>(hav=
en&#39;t checked it), but I don&#39;t understand what are these lines in xe=
n.inc for?<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Mon, Nov 6, 2017 at 10:45 AM, Wei, Yunguo (Bryan) <span dir=3D"ltr">&=
lt;<a href=3D"mailto:Yunguo.Wei@windriver.com" target=3D"_blank">Yunguo.Wei=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Y=
an<br>
<br>
Do you know why this patch was not merged? I&#39;m running into same proble=
m.<br>
<br>
Regards,<br>
Yunguo<br>
<div><div class=3D"h5"><br>
-----Original Message-----<br>
From: <a href=3D"mailto:meta-virtualization-bounces@yoctoproject.org">meta-=
virtualization-bounces@<wbr>yoctoproject.org</a> [mailto:<a href=3D"mailto:=
meta-virtualization-bounces@yoctoproject.org">meta-virtualization-<wbr>boun=
ces@yoctoproject.org</a>] On Behalf Of Yan Yankovskyi<br>
Sent: Wednesday, August 30, 2017 5:03 PM<br>
To: <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiza=
tion@<wbr>yoctoproject.org</a><br>
Subject: [meta-virtualization] [PATCH] xen: delete references to xenstored.=
socket and xenstored_ro.socket in xen.inc<br>
<br>
These files were removed since the following patch <a href=3D"http://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D976ce01e103fc03bb3336cdbc6c951=
a709e285fe" rel=3D"noreferrer" target=3D"_blank">http://xenbits.xen.org/git=
web/<wbr>?p=3Dxen.git;a=3Dcommit;h=3D<wbr>976ce01e103fc03bb3336cdbc6c951<wb=
r>a709e285fe</a><br>
and are absent in xen 4.8.0 and further, which leads to the following error=
 during the Xen build process:<br>
do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not =
exist<br>
<br>
Signed-off-by: Yan Yankovskyi &lt;<a href=3D"mailto:yan.yankovskyi@globallo=
gic.com">yan.yankovskyi@globallogic.<wbr>com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc in=
dex b5c5f03..717424b 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -687,8 +687,6 @@ FILES_${PN}-xencommons +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>xenconsoled.service \<br=
>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xen-<wbr>init-dom0.service \<=
br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>xenstored.service \<br>
-=C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>xenstored.socket \<br>
-=C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>xenstored_ro.socket \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/var-<wbr>lib-xenstored.mount =
\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
@@ -728,8 +726,6 @@ SYSTEMD_SERVICE_${PN}-<wbr>xencommons =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0xenconsoled.service \<br>
=C2=A0 =C2=A0 =C2=A0xen-init-dom0.service \<br>
=C2=A0 =C2=A0 =C2=A0xenstored.service \<br>
-=C2=A0 =C2=A0 xenstored.socket \<br>
-=C2=A0 =C2=A0 xenstored_ro.socket \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-<wbr>xendomains =3D &quot;xendomains.service&qu=
ot;<br>
<br>
--<br>
1.9.1<br>
<br>
</div></div>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><span><font color=3D"#888888"><div><font size=3D"-1"><span style=
=3D"vertical-align:baseline;font-variant:normal;font-style:normal;font-size=
:12px;background-color:transparent;text-decoration:none;font-family:Arial;f=
ont-weight:bold">Best regards,<br></span></font></div><div><font size=3D"-1=
"><span style=3D"vertical-align:baseline;font-variant:normal;font-style:nor=
mal;font-size:12px;background-color:transparent;text-decoration:none;font-f=
amily:Arial;font-weight:bold"><br></span></font></div><div><font size=3D"-1=
"><span style=3D"vertical-align:baseline;font-variant:normal;font-style:nor=
mal;font-size:12px;background-color:transparent;text-decoration:none;font-f=
amily:Arial;font-weight:bold">Yan Yankovskyi | Associate Software Engineer<=
/span></font><font size=3D"-1"><span style=3D"vertical-align:baseline;font-=
variant:normal;font-style:normal;font-size:12px;background-color:transparen=
t;text-decoration:none;font-family:Arial;font-weight:bold">, Ukraine</span>=
</font></div><div><font size=3D"-1"><span style=3D"vertical-align:baseline;=
font-variant:normal;font-style:normal;font-size:12px;background-color:trans=
parent;text-decoration:none;font-family:Arial;font-weight:normal">GlobalLog=
ic</span><br></font></div><div><font size=3D"-1"></font></div><div><font si=
ze=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-s=
tyle:normal;font-size:12px;background-color:transparent;text-decoration:non=
e;font-family:Arial;font-weight:normal">M=C2=A0 </span></font><font size=3D=
"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-style:=
normal;font-size:12px;background-color:transparent;text-decoration:none;fon=
t-family:Arial;font-weight:normal"><span><span style=3D"vertical-align:base=
line;background-color:transparent"><font face=3D"Arial"><span style=3D"font=
-size:12px"><a href=3D"tel:+380950496473" value=3D"+380672382740" target=3D=
"_blank">+380.95.049.64.73</a></span></font></span></span>=C2=A0=C2=A0 Skyp=
e </span></font><span><span style=3D"vertical-align:baseline;background-col=
or:transparent"><font face=3D"Arial"><span style=3D"font-size:12px"><a>huan=
desale</a></span></font></span></span></div><div><font size=3D"-1"><span st=
yle=3D"font-size:12px;font-family:Arial;color:#1155cc;background-color:tran=
sparent;font-weight:normal;font-style:normal;font-variant:normal;text-decor=
ation:underline;vertical-align:baseline"><br></span></font></div><div><font=
 size=3D"-1"><a href=3D"http://www.globallogic.com/" target=3D"_blank"><spa=
n style=3D"font-size:12px;font-family:Arial;color:#1155cc;background-color:=
transparent;font-weight:normal;font-style:normal;font-variant:normal;text-d=
ecoration:underline;vertical-align:baseline">www.globallogic.com</span></a>=
<br></font></div><font size=3D"-1"><br><a href=3D"http://www.globallogic.co=
m/email_disclaimer.txt" target=3D"_blank"><span style=3D"font-size:11px;fon=
t-family:Arial;color:#1155cc;background-color:transparent;font-weight:norma=
l;font-style:normal;font-variant:normal;text-decoration:underline;vertical-=
align:baseline">http://www.globallogic.com/email_disclaimer.txt</span></a><=
/font></font></span></div></div></div></div>
</div>

--089e0828102809a37e055d4d6ffa--
