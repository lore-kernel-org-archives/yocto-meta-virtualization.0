Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C49DE013EB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Jan 2013 05:39:26 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id a13so1203819eaa.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Jan 2013 05:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+6C8O5o4kAVIbo4IcA1Hw7ad4SATy+19bie14rG4Vhg=;
	b=p02RIcNQL2gnUESkU6IZoD99m3zA4bgDunes+TWlPg/ufSnYjwX8DJYDHU+08Y4u9v
	NnpLg1veIjg7QI6YMjrRGB7DyKV3ljlkoeBbyy7hlhSWLTXdeISAQSrllf8AMGB354v2
	TWujYb2Y9fwW7mdi3X6hDU86Vd9Tb14ffkABXsXDbzgHVZxReQOd4JYrS5ocK8o5fuJW
	b8lOdPc09Okxy5StizzTK5UnZOfn5n5Ry2IDcSI7YUFmHf8cDsaweDl3ZrvX8cfTV+RR
	rg/uVZqfSxB+4LgKB+xthGe5lG4NPZ/jcVlBB1UreidNTpP4daU5MaMDKJpRK4OHL41M
	MlFw==
MIME-Version: 1.0
X-Received: by 10.14.218.71 with SMTP id j47mr27267664eep.28.1359639565368;
	Thu, 31 Jan 2013 05:39:25 -0800 (PST)
Received: by 10.14.207.72 with HTTP; Thu, 31 Jan 2013 05:39:25 -0800 (PST)
In-Reply-To: <1359616727-15082-1-git-send-email-lei.yang@windriver.com>
References: <1359616727-15082-1-git-send-email-lei.yang@windriver.com>
Date: Thu, 31 Jan 2013 08:39:25 -0500
Message-ID: <CADkTA4M6MPUeC6XfHnWOgbYEbC3tiWauf7NyyZm0UPq05SjD9w@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 Jan 2013 13:39:26 -0000
Content-Type: multipart/alternative; boundary=047d7b621afc50ff2404d495c170

--047d7b621afc50ff2404d495c170
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 31, 2013 at 2:18 AM, <lei.yang@windriver.com> wrote:

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
> This is because openvswitch damon isn't running,so we'd better start it at
> the boot time.
> The split-pacakage ${PN}-switch ${PN}-controller provide us to start
> nessary damon with update-rc.d
>

s/pacakage/package/
s/nessary/necessary/
s/damon/daemon/


> so we add them to the RDEPENDS.
>
> Since openvswtich depends on openvswtich kernel module,so auto load the
> kernel module too.
>

s/openvswtich/openvswitch/



>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> Tested-by: Lei Yang <lei.yang@windriver.com>
>

We can drop the Tested-by: since it is your patch :)

I can make the changes below if you agree with them, and save us another
revision
of the patch.

Cheers,

Bruce


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
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b621afc50ff2404d495c170
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 31, 2013 at 2:18 AM,  <span dir=3D"ltr">&lt;<a href=3D"=
mailto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver.com</a>=
&gt;</span> wrote:<br>
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
This is because openvswitch damon isn&#39;t running,so we&#39;d better star=
t it at the boot time.<br>
The split-pacakage ${PN}-switch ${PN}-controller provide us to start nessar=
y damon with update-rc.d<br></blockquote><div><br></div><div style>s/pacaka=
ge/package/</div><div style>s/nessary/necessary/<br></div><div style>s/damo=
n/daemon/<br>
</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex">
so we add them to the RDEPENDS.<br>
<br>
Since openvswtich depends on openvswtich kernel module,so auto load the ker=
nel module too.<br></blockquote><div><br></div><div style>s/openvswtich/ope=
nvswitch/</div><div style><br></div><div>=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

<br>
Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.y=
ang@windriver.com</a>&gt;<br>
Tested-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.yang@=
windriver.com</a>&gt;<br></blockquote><div><br></div><div style>We can drop=
 the Tested-by: since it is your patch :)</div><div style><br></div><div st=
yle>
I can make the changes below if you agree with them, and save us another re=
vision</div><div style>of the patch.</div><div style><br></div><div style>C=
heers,</div><div style><br></div><div style>Bruce</div><div>=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding=
-left:1ex">

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
<span class=3D""><font color=3D"#888888">--<br>
1.7.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div>

--047d7b621afc50ff2404d495c170--
