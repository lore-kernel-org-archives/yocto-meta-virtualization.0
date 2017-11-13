Return-Path: <yan.yankovskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72797E00D04; Mon, 13 Nov 2017 01:40:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 749FFE00CF2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 01:40:39 -0800 (PST)
Received: by mail-wr0-f175.google.com with SMTP id 4so13851222wrt.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 01:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pnsqVYzlXlLLtHPClwFGs297CIyRtUiPHcNmWwliVQA=;
	b=Vu9Vg+aE95mTNurngI2DTNlDVcoU8kI3AgbVFOeOq2E59UC2F8cIQlPiRRFcy63H8F
	FXnK6+dgkT/Nb9ch7EIOWBz6JzTXrDpbumxAtJl+vEy241EVLcC1fwOkjHIrJdZFaCZn
	gsAueQfDrSTOL5mc2SiPM1O8FMIf3qqAYjrh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pnsqVYzlXlLLtHPClwFGs297CIyRtUiPHcNmWwliVQA=;
	b=T2k9WNiyIBp7Xfg4zzajw1sL0YP9a+O9v2TwwUmU6QAqKYoRDB859oRsFpHaDf2yIX
	1sSeuJX95OmVHA9G0fCp2wqPH7Agvr7vfmaEy/HejGXH4v2TAP6N9N5JPh3TWlEibIct
	BbwiGNNnmtREPvaPDoS4bZpgsa10vOh+C0eoFqJYpw3qHttyZi6T9hOan4DyzNtG9ton
	8lzKxgEnVWrI89MS8UTyBfl1669+f/3WIfm1/Vnx0fH83wrPH2fT045DB7OuJx7yx/Ta
	r3BWhyc2QVJLr+ol6Y2+8NggZZUpvgTnpOaF/Fy08scmMU4IfBLw1QUby7/ehZ14DP9e
	ZXOQ==
X-Gm-Message-State: AJaThX4sDveGpab7oK2GzukmD/fJqND47XBhIxDw4xk83+0lMHwOTx4X
	3k/wQjbkqcnrX7PAzZYv+IXMMBeyP2D31DlQY0TbmQ==
X-Google-Smtp-Source: AGs4zMaXba+CiYuuW0SMYe6XvgSbrKYz37pFkMOw5E8xz3UYEO9dE/wengJB20OVKe531+8g9sT0Ro/owNyr31DByRc=
X-Received: by 10.223.136.250 with SMTP id g55mr6878435wrg.54.1510566038080;
	Mon, 13 Nov 2017 01:40:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.182.139 with HTTP; Mon, 13 Nov 2017 01:40:37 -0800 (PST)
In-Reply-To: <CAPaNuAsAX0tZORrXY+PGRoPa2g=_Mwou_64PExf9sE8xNw7ybg@mail.gmail.com>
References: <CAPaNuAsAX0tZORrXY+PGRoPa2g=_Mwou_64PExf9sE8xNw7ybg@mail.gmail.com>
From: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
Date: Mon, 13 Nov 2017 10:40:37 +0100
Message-ID: <CAPaNuAsyk+KMAJxO+P31Ku8nCQPWpG6qDuEq4Rym8i=WoQ62MA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Mon, 13 Nov 2017 09:40:40 -0000
Content-Type: multipart/alternative; boundary="001a11491d2a1c2b05055dda10ad"

--001a11491d2a1c2b05055dda10ad
Content-Type: text/plain; charset="UTF-8"

So, what do you think about this patch? Presence of references to these
files breaks out of box xen build, and no one cares. Am I missing
something, or just so few people use xen?

On Mon, Nov 6, 2017 at 3:24 PM, Yan Yankovskyi <
yan.yankovskyi@globallogic.com> wrote:

> These files were removed since the followine patch
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=
> 976ce01e103fc03bb3336cdbc6c951a709e285fe
> and are absent in xen 4.8.0 and further, which leads to
> the following error during the Xen build process:
> do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not
> exist
>
> Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
> ---
>  recipes-extended/xen/xen.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index cb314f8..4d56de9 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -739,8 +739,6 @@ FILES_${PN}-xencommons += "\
>      ${systemd_unitdir}/system/xenconsoled.service \
>      ${systemd_unitdir}/system/xen-init-dom0.service \
>      ${systemd_unitdir}/system/xenstored.service \
> -    ${systemd_unitdir}/system/xenstored.socket \
> -    ${systemd_unitdir}/system/xenstored_ro.socket \
>      ${systemd_unitdir}/system/var-lib-xenstored.mount \
>      "
>
> @@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
>      xenconsoled.service \
>      xen-init-dom0.service \
>      xenstored.service \
> -    xenstored.socket \
> -    xenstored_ro.socket \
>      "
>  SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
>
> --
> 2.7.4
>
> --
> Best regards,
>
> Yan Yankovskyi | Associate Software Engineer, Ukraine
> GlobalLogic
> M  +380.95.049.64.73 <+380950496473>   Skype huandesale
>
> www.globallogic.com
>
> http://www.globallogic.com/email_disclaimer.txt
>



-- 
Best regards,

Yan Yankovskyi | Junior Software Engineer, Ukraine
GlobalLogic
M  +380.95.049.64.73 <+380950496473>   Skype huandesale

www.globallogic.com

http://www.globallogic.com/email_disclaimer.txt

--001a11491d2a1c2b05055dda10ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So, what do you think about this patch? Presence of refere=
nces to these files breaks out of box xen build, and no one cares. Am I mis=
sing something, or just so few people use xen?<br></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Mon, Nov 6, 2017 at 3:24 PM, Yan =
Yankovskyi <span dir=3D"ltr">&lt;<a href=3D"mailto:yan.yankovskyi@globallog=
ic.com" target=3D"_blank">yan.yankovskyi@globallogic.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">These files were rem=
oved since the followine patch<br><a href=3D"http://xenbits.xen.org/gitweb/=
?p=3Dxen.git;a=3Dcommit;h=3D976ce01e103fc03bb3336cdbc6c951a709e285fe" targe=
t=3D"_blank">http://xenbits.xen.org/gitweb/<wbr>?p=3Dxen.git;a=3Dcommit;h=
=3D<wbr>976ce01e103fc03bb3336cdbc6c951<wbr>a709e285fe</a><br>and are absent=
 in xen 4.8.0 and further, which leads to<br>the following error during the=
 Xen build process:<br>do_package: SYSTEMD_SERVICE_xen-xencommons value xen=
stored.socket does not exist<br><br>Signed-off-by: Yan Yankovskyi &lt;<a hr=
ef=3D"mailto:yan.yankovskyi@globallogic.com" target=3D"_blank">yan.yankovsk=
yi@globallogic.<wbr>com</a>&gt;<br>---<br>=C2=A0recipes-extended/xen/xen.in=
c | 4 ----<br>=C2=A01 file changed, 4 deletions(-)<br><br>diff --git a/reci=
pes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br>index cb314f8..4=
d56de9 100644<br>--- a/recipes-extended/xen/xen.inc<br>+++ b/recipes-extend=
ed/xen/xen.inc<br>@@ -739,8 +739,6 @@ FILES_${PN}-xencommons +=3D &quot;\<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/<wbr>xenconsoled.servi=
ce \<br>=C2=A0=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/xen-<wbr>init-do=
m0.service \<br>=C2=A0=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/<wbr>xen=
stored.service \<br>-=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/<wbr>xens=
tored.socket \<br>-=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/<wbr>xensto=
red_ro.socket \<br>=C2=A0=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/var-<=
wbr>lib-xenstored.mount \<br>=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br><br>@@ -780=
,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-<wbr>xencommons =3D &quot; \<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 xenconsoled.service \<br>=C2=A0=C2=A0=C2=A0=C2=A0 xen-in=
it-dom0.service \<br>=C2=A0=C2=A0=C2=A0=C2=A0 xenstored.service \<br>-=C2=
=A0=C2=A0=C2=A0 xenstored.socket \<br>-=C2=A0=C2=A0=C2=A0 xenstored_ro.sock=
et \<br>=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>=C2=A0SYSTEMD_SERVICE_${PN}-<wbr=
>xendomains =3D &quot;xendomains.service&quot;<span class=3D"HOEnZb"><font =
color=3D"#888888"><br><br>-- <br>2.7.4<br clear=3D"all"><br>-- <br><div cla=
ss=3D"m_8350084603974628919gmail_signature"><div dir=3D"ltr"><div><div dir=
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
yle=3D"font-size:12px;font-family:Arial;color:rgb(17,85,204);background-col=
or:transparent;font-weight:normal;font-style:normal;font-variant:normal;tex=
t-decoration:underline;vertical-align:baseline"><br></span></font></div><di=
v><font size=3D"-1"><a href=3D"http://www.globallogic.com/" target=3D"_blan=
k"><span style=3D"font-size:12px;font-family:Arial;color:rgb(17,85,204);bac=
kground-color:transparent;font-weight:normal;font-style:normal;font-variant=
:normal;text-decoration:underline;vertical-align:baseline">www.globallogic.=
com</span></a><br></font></div><font size=3D"-1"><br><a href=3D"http://www.=
globallogic.com/email_disclaimer.txt" target=3D"_blank"><span style=3D"font=
-size:11px;font-family:Arial;color:rgb(17,85,204);background-color:transpar=
ent;font-weight:normal;font-style:normal;font-variant:normal;text-decoratio=
n:underline;vertical-align:baseline">http://www.globallogic.com/<wbr>email_=
disclaimer.txt</span></a></font></font></span></div></div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><span><font color=3D"#888888"><div><font size=3D"-1"><span s=
tyle=3D"vertical-align:baseline;font-variant:normal;font-style:normal;font-=
size:12px;background-color:transparent;text-decoration:none;font-family:Ari=
al;font-weight:bold">Best regards,<br></span></font></div><div><font size=
=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-sty=
le:normal;font-size:12px;background-color:transparent;text-decoration:none;=
font-family:Arial;font-weight:bold"><br></span></font></div><div><font size=
=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-sty=
le:normal;font-size:12px;background-color:transparent;text-decoration:none;=
font-family:Arial;font-weight:bold">Yan Yankovskyi | Junior Software Engine=
er</span></font><font size=3D"-1"><span style=3D"vertical-align:baseline;fo=
nt-variant:normal;font-style:normal;font-size:12px;background-color:transpa=
rent;text-decoration:none;font-family:Arial;font-weight:bold">, Ukraine</sp=
an></font></div><div><font size=3D"-1"><span style=3D"vertical-align:baseli=
ne;font-variant:normal;font-style:normal;font-size:12px;background-color:tr=
ansparent;text-decoration:none;font-family:Arial;font-weight:normal">Global=
Logic</span><br></font></div><div><font size=3D"-1"></font></div><div><font=
 size=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;fon=
t-style:normal;font-size:12px;background-color:transparent;text-decoration:=
none;font-family:Arial;font-weight:normal">M=C2=A0 </span></font><font size=
=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-sty=
le:normal;font-size:12px;background-color:transparent;text-decoration:none;=
font-family:Arial;font-weight:normal"><span><span style=3D"vertical-align:b=
aseline;background-color:transparent"><font face=3D"Arial"><span style=3D"f=
ont-size:12px"><a href=3D"tel:+380950496473" value=3D"+380672382740" target=
=3D"_blank">+380.95.049.64.73</a></span></font></span></span>=C2=A0=C2=A0 S=
kype </span></font><span><span style=3D"vertical-align:baseline;background-=
color:transparent"><font face=3D"Arial"><span style=3D"font-size:12px"><a>h=
uandesale</a></span></font></span></span></div><div><font size=3D"-1"><span=
 style=3D"font-size:12px;font-family:Arial;color:#1155cc;background-color:t=
ransparent;font-weight:normal;font-style:normal;font-variant:normal;text-de=
coration:underline;vertical-align:baseline"><br></span></font></div><div><f=
ont size=3D"-1"><a href=3D"http://www.globallogic.com/" target=3D"_blank"><=
span style=3D"font-size:12px;font-family:Arial;color:#1155cc;background-col=
or:transparent;font-weight:normal;font-style:normal;font-variant:normal;tex=
t-decoration:underline;vertical-align:baseline">www.globallogic.com</span><=
/a><br></font></div><font size=3D"-1"><br><a href=3D"http://www.globallogic=
.com/email_disclaimer.txt" target=3D"_blank"><span style=3D"font-size:11px;=
font-family:Arial;color:#1155cc;background-color:transparent;font-weight:no=
rmal;font-style:normal;font-variant:normal;text-decoration:underline;vertic=
al-align:baseline">http://www.globallogic.com/email_disclaimer.txt</span></=
a></font></font></span></div></div></div></div></div></div>
</div>

--001a11491d2a1c2b05055dda10ad--
