Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D524E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:46:13 -0800 (PST)
Received: by mail-lb0-f174.google.com with SMTP id l12so745405lbo.33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Y5r3Ppugaiw7jw6wgTd/S6b2C9HFpuhYFeUSkp3zgp4=;
	b=akY2tlPTN9zN7ysCu1LEYbB03jMAvcGi0STLr3ycgagxpZYKELyrRzrteM3nNVHtyy
	ICFivvOORbNkh0drHQxCzCj5Vc32sq/K+1xtx+dH8ofEnjKsDpFbk9oD1ZxRDO60C47J
	kp4cJcHuMgf+zsGqnCusfdGbfLVaf5jou2Vv1RKPh+2b4iZaSZ1ajTG6S4LYCeav0c3P
	z1cT2sFpF1m9IE6uTggACb3IlyNwK37UyeFI2EkKImT2nOXY71QhXmZ/39zHJLD7vQZj
	UmR57lGdIob97B8Yk+OgEkzCOWR/miq95o68X9i4juVH8BN+np/0wMZfHRu0qmPQV57V
	vgKg==
MIME-Version: 1.0
X-Received: by 10.152.125.237 with SMTP id mt13mr1174636lab.45.1359467172003; 
	Tue, 29 Jan 2013 05:46:12 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Tue, 29 Jan 2013 05:46:11 -0800 (PST)
In-Reply-To: <1359370883-2033-1-git-send-email-lei.yang@windriver.com>
References: <1359370883-2033-1-git-send-email-lei.yang@windriver.com>
Date: Tue, 29 Jan 2013 08:46:11 -0500
Message-ID: <CADkTA4N0LWxDXWSGnUzUQKgGWPEtZ0wyzNF4p9Jf68xTZ5uDWw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei yang <lei.yang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswtich: start openvswitch at the boot time
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
X-List-Received-Date: Tue, 29 Jan 2013 13:46:14 -0000
Content-Type: multipart/alternative; boundary=f46d04426cccdf01ac04d46d9d8e

--f46d04426cccdf01ac04d46d9d8e
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 28, 2013 at 6:01 AM, <lei.yang@windriver.com> wrote:

> From: Lei Yang <lei.yang@windriver.com>
>
> When I define the bridge, I get below error
>
> root@intel_5500_server:~# ovs-vsctl add-br ovsbr0
> Jan 25 17:34:07|00002|stream_unix|ERR|/tmp/stream-unix.1487.0: connection
> to /var/run/openvswitch/db.sock
> failed: No such file or directory
> ........
> ........
>
> This is becasue openvswitch isn't running,so we'd better start it at the
> boot time.
>

s/becasue/because/

Can you elaborate on this a bit more as well. What you are actually doing
in the
patch is adding to the RDEPENDS of openvswitch and it's the dependencies
that
you are adding, that once installed are starting the switch at runtime ..
right ? The
reason I'd like it clarified is that when I read your patch, I expected to
see an initscript
update, or inherit rc.d, but found the RDEPENDS update instead.


> Since openvswtich depends on openvswtich module,so auto load the kernel
> module too.


> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> Tested-by: Lei Yang <lei.yang@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |    2 +-
>  .../openvswitch/openvswitch_1.4.3.bb               |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..918302a 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -5,4 +5,4 @@ SRC_URI += "file://xt-checksum.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
>             "
> -
> +module_autoload_openvswitch = "openvswitch"
>

This looks fine. I double checked that the vswitch kernel fragment enables
the module,
so our autoload is fine.

Bruce


> diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bbb/recipes-networking/openvswitch/
> openvswitch_1.4.3.bb
> index 88f0114..6764073 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
> @@ -7,7 +7,7 @@ LICENSE = "Apache-2"
>  DEPENDS += "bridge-utils openssl python perl"
>
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
> -              python perl perl-module-strict"
> +              python perl perl-module-strict ${PN}-switch
> ${PN}-controller"
>  RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>  RDEPENDS_${PN}-pki = "${PN}"
> --
> 1.7.1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"


On Mon, Jan 28, 2013 at 6:01 AM, <lei.yang@windriver.com> wrote:

> From: Lei Yang <lei.yang@windriver.com>
>
> When I define the bridge, I get below error
>
> root@intel_5500_server:~# ovs-vsctl add-br ovsbr0
> Jan 25 17:34:07|00002|stream_unix|ERR|/tmp/stream-unix.1487.0: connection
> to /var/run/openvswitch/db.sock
> failed: No such file or directory
> ........
> ........
>
> This is becasue openvswitch isn't running,so we'd better start it at the
> boot time.
> Since openvswtich depends on openvswtich module,so auto load the kernel
> module too.
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> Tested-by: Lei Yang <lei.yang@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |    2 +-
>  .../openvswitch/openvswitch_1.4.3.bb               |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..918302a 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -5,4 +5,4 @@ SRC_URI += "file://xt-checksum.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
>             "
> -
> +module_autoload_openvswitch = "openvswitch"
> diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bbb/recipes-networking/openvswitch/
> openvswitch_1.4.3.bb
> index 88f0114..6764073 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
> @@ -7,7 +7,7 @@ LICENSE = "Apache-2"
>  DEPENDS += "bridge-utils openssl python perl"
>
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
> -              python perl perl-module-strict"
> +              python perl perl-module-strict ${PN}-switch
> ${PN}-controller"
>  RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>  RDEPENDS_${PN}-pki = "${PN}"
> --
> 1.7.1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d04426cccdf01ac04d46d9d8e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Mon, Jan 28, 2013 at 6:01 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.co=
m">lei.yang@windriver.com</a>&gt;<br>

<br>
When I define the bridge, I get below error<br>
<br>
root@intel_5500_server:~# ovs-vsctl add-br ovsbr0<br>
Jan 25 17:34:07|00002|stream_unix|ERR|/tmp/stream-unix.1487.0: connection t=
o /var/run/openvswitch/db.sock<br>
failed: No such file or directory<br>
........<br>
........<br>
<br>
This is becasue openvswitch isn&#39;t running,so we&#39;d better start it a=
t the boot time.<br></blockquote><div><br></div><div style>s/becasue/becaus=
e/</div><div style><br></div><div>Can you elaborate on this a bit more as w=
ell. What you are actually doing in the<br>
</div><div>patch is adding to the RDEPENDS of openvswitch and it&#39;s the =
dependencies that</div><div>you are adding, that once installed are startin=
g the switch at runtime .. right ? The</div><div>reason I&#39;d like it cla=
rified is that when I read your patch, I expected to see an initscript</div=
>
<div>update, or inherit rc.d, but found the RDEPENDS update instead.</div><=
div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex">

Since openvswtich depends on openvswtich module,so auto load the kernel mod=
ule too.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">

<br>
Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.y=
ang@windriver.com</a>&gt;<br>
Tested-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.yang@=
windriver.com</a>&gt;<br>
---<br>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend =A0 =A0 =A0| =A0 =A02 +-<b=
r>
=A0.../openvswitch/<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank=
">openvswitch_1.4.3.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..918302a 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -5,4 +5,4 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://vswitch.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
-<br>
+module_autoload_openvswitch =3D &quot;openvswitch&quot;<br></blockquote><d=
iv style><br></div><div style>This looks fine. I double checked that the vs=
witch kernel fragment enables the module,</div><div style>so our autoload i=
s fine.</div>
<div style><br></div><div style>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
diff --git a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_1=
.4.3.bb" target=3D"_blank">openvswitch_1.4.3.bb</a> b/recipes-networking/op=
envswitch/<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">openvsw=
itch_1.4.3.bb</a><br>

index 88f0114..6764073 100644<br>
--- a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_1.4.3.bb=
" target=3D"_blank">openvswitch_1.4.3.bb</a><br>
+++ b/recipes-networking/openvswitch/<a href=3D"http://openvswitch_1.4.3.bb=
" target=3D"_blank">openvswitch_1.4.3.bb</a><br>
@@ -7,7 +7,7 @@ LICENSE =3D &quot;Apache-2&quot;<br>
=A0DEPENDS +=3D &quot;bridge-utils openssl python perl&quot;<br>
<br>
=A0RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0python perl perl-module-strict&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0python perl perl-module-strict ${PN}-switch ${=
PN}-controller&quot;<br>
=A0RDEPENDS_${PN}-controller =3D &quot;${PN} lsb ${PN}-pki&quot;<br>
=A0RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidgen&=
quot;<br>
=A0RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.1<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Mon, Jan 28, 2013 at 6:01 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:le=
i.yang@windriver.com" target=3D"_blank">lei.yang@windriver.com</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Lei Yang &lt;<a href=3D"mailto:lei.yan=
g@windriver.com">lei.yang@windriver.com</a>&gt;<br>
<br>
When I define the bridge, I get below error<br>
<br>
root@intel_5500_server:~# ovs-vsctl add-br ovsbr0<br>
Jan 25 17:34:07|00002|stream_unix|ERR|/tmp/stream-unix.1487.0: connection t=
o /var/run/openvswitch/db.sock<br>
failed: No such file or directory<br>
........<br>
........<br>
<br>
This is becasue openvswitch isn&#39;t running,so we&#39;d better start it a=
t the boot time.<br>
Since openvswtich depends on openvswtich module,so auto load the kernel mod=
ule too.<br>
<br>
Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.y=
ang@windriver.com</a>&gt;<br>
Tested-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.yang@=
windriver.com</a>&gt;<br>
---<br>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend =A0 =A0 =A0| =A0 =A02 +-<b=
r>
=A0.../openvswitch/<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank=
">openvswitch_1.4.3.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..918302a 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -5,4 +5,4 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://vswitch.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
-<br>
+module_autoload_openvswitch =3D &quot;openvswitch&quot;<br>
diff --git a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_1=
.4.3.bb" target=3D"_blank">openvswitch_1.4.3.bb</a> b/recipes-networking/op=
envswitch/<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank">openvsw=
itch_1.4.3.bb</a><br>

index 88f0114..6764073 100644<br>
--- a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_1.4.3.bb=
" target=3D"_blank">openvswitch_1.4.3.bb</a><br>
+++ b/recipes-networking/openvswitch/<a href=3D"http://openvswitch_1.4.3.bb=
" target=3D"_blank">openvswitch_1.4.3.bb</a><br>
@@ -7,7 +7,7 @@ LICENSE =3D &quot;Apache-2&quot;<br>
=A0DEPENDS +=3D &quot;bridge-utils openssl python perl&quot;<br>
<br>
=A0RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0python perl perl-module-strict&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0python perl perl-module-strict ${PN}-switch ${=
PN}-controller&quot;<br>
=A0RDEPENDS_${PN}-controller =3D &quot;${PN} lsb ${PN}-pki&quot;<br>
=A0RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidgen&=
quot;<br>
=A0RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.1<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div>

--f46d04426cccdf01ac04d46d9d8e--
