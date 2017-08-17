Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D86BE00D95; Thu, 17 Aug 2017 08:56:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM,URIBL_SBL autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.181 listed in list.dnswl.org]
	*  1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL blocklist
	*      [URIs: yoctoproject.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.181 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBD2DE00D57
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:55:59 -0700 (PDT)
Received: by mail-qt0-f181.google.com with SMTP id t37so39816326qtg.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VTfTT4J6S039K87dxrtCy43KC6JJdqCoG8SW8jQPyPw=;
	b=AYsWlYdEJVFFSTXyVfZYH0q053ZktgrJHNJFnbLRLyipTDlBk8SsuxzEa78NgktlCl
	O8ZneHB/urWkAuJweO81YmpT5GygW4w9nFb/+O4KHJdpSjaDkmQNIokXao6+UL+wruWu
	oktUyZWEojExALmht9hVBloNhSmw5SiktELdbjzj46NNDY2WrspAe7nE8m0plh2LXmPg
	/t0LzR2tIFBfAShsvvCirNLMSf1N1oSmkw8irkAx1nNp+b7iaFdU51wzpx4PVghe/rof
	tiHVDOvuF5J8t3iNa89rUEonZIbhz1OF1egt4C3RwkMyWFwxuUWCPl+c5d5VLD5/X+iz
	aO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VTfTT4J6S039K87dxrtCy43KC6JJdqCoG8SW8jQPyPw=;
	b=d4ur/uNBhWTUbkCnd5pblJaXTTcjM9BWgEzF5W8wTyWW5znpNSZznEODLUcHMhsj+2
	qM140Y9jZ7gvlRhkOKdMyQbMX2a3OjBp9mz9zraPIGZ5CrVnwezVObD5umtUcK7WbHpc
	AvTgpmJRloleAft0XVpRPKySOyk9QteMVtD9Uvpva5KWElsyCllsAG93gheyqgqkfVQU
	hQoD10U0WLSj7N1WoFaTbSH65p4icfCz6+unbOJzZJ+hg0gRotX5bnEunalTVy2MKDBF
	ORAUkl/pJqjb/ZqhVYAJ5fquaKzhswtUedSpnUYQt5cng+trfuOBJQKpNUm6gTr3l0bq
	1OCA==
X-Gm-Message-State: AHYfb5g8KcqP/XBoQkwXlcn0q9hlclFnDFDNDM+juGBZwUFa3yud2mSU
	Q/OOIfydbcehVAI8/i0QUHmF2ERf6w==
X-Received: by 10.237.60.20 with SMTP id t20mr8258701qte.289.1502985358768;
	Thu, 17 Aug 2017 08:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Thu, 17 Aug 2017 08:55:58 -0700 (PDT)
In-Reply-To: <1502976861-19480-1-git-send-email-bobadeshrikant@gmail.com>
References: <1502976861-19480-1-git-send-email-bobadeshrikant@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Aug 2017 11:55:58 -0400
Message-ID: <CADkTA4OK+K-+9MQOzHXEy2beDLeC=z4B6_kY0MnoKeAaoVZ2pA@mail.gmail.com>
To: Shrikant Bobade <bobadeshrikant@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Shrikant Bobade <shrikant_bobade@mentor.com>
Subject: Re: [meta-cloud-services][PATCH] rabbitmq-server: add systemd support
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
X-List-Received-Date: Thu, 17 Aug 2017 15:56:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c0e6100697d990556f50c85"

--94eb2c0e6100697d990556f50c85
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Aug 17, 2017 at 9:34 AM, Shrikant Bobade <bobadeshrikant@gmail.com>
wrote:

> From: Shrikant Bobade <shrikant_bobade@mentor.com>
>
> add systemd support to bring-up out of box rabbitmq-server support.
> rabbitmq-server-setup: essential setup required by rabbitmq-server
> rabbitmq-server.service: systemd support service file
>
> Signed-off-by: Shrikant Bobade <shrikant_bobade@mentor.com>
> ---
>  .../rabbitmq/files/rabbitmq-server-setup           | 26
> ++++++++++++++++++++++
>  .../rabbitmq/files/rabbitmq-server.service         | 13 +++++++++++
>  .../rabbitmq/rabbitmq-server_3.2.4.bb              | 14 +++++++++++-
>  3 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100755 meta-openstack/recipes-extended/rabbitmq/files/
> rabbitmq-server-setup
>  create mode 100644 meta-openstack/recipes-extended/rabbitmq/files/
> rabbitmq-server.service
>
> diff --git a/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup
> b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup
> new file mode 100755
> index 0000000..343c775
> --- /dev/null
> +++ b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +#
> +# rabbitmq-server-setup RabbitMQ broker setup
> +#
> +# description: To Enable AMQP server provided by RabbitMQ,
> +#              this setup required before starting rabbitmq-server.
> +#
> +##
> +
> +
> +# Ensure that HOME is set, since the erlang cookie file must be written
> +# somewhere
> +export HOME=/home/root
> +
> +USER=root
> +ROTATE_SUFFIX=
> +INIT_LOG_DIR=/var/log/rabbitmq
> +
> +# setup log dir and files for rabbitmq server
> +if [ ! -d ${INIT_LOG_DIR} ]; then
> +        mkdir ${INIT_LOG_DIR}
> +        chmod 0755 ${INIT_LOG_DIR}
> +        chown $USER:$USER ${INIT_LOG_DIR}
> +        touch ${INIT_LOG_DIR}/startup_err
> +        touch ${INIT_LOG_DIR}/startup_log
> +fi
> diff --git a/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server.service
> b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server.service
> new file mode 100644
> index 0000000..414ea50
> --- /dev/null
> +++ b/meta-openstack/recipes-extended/rabbitmq/files/
> rabbitmq-server.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=RabbitMQ Messaging broker/server service
> +After=network.target
> +
> +[Service]
> +Type=simple
> +User=root
> +ExecStartPre=/usr/bin/rabbitmq-server-setup
> +ExecStart=/usr/bin/rabbitmq-server
> +ExecStop=/usr/bin/rabbitmqctl stop
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-
> server_3.2.4.bb b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-
> server_3.2.4.bb
> index 101d098..8e4be5f 100644
> --- a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
> +++ b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
> @@ -10,6 +10,8 @@ SRC_URI = "http://www.rabbitmq.com/
> releases/rabbitmq-server/v${PV}/${PN}-${PV}.t
>             file://rabbitmq-server \
>             file://remove-docs.patch \
>             file://cleanup_install.patch \
> +           file://rabbitmq-server.service \
> +           file://rabbitmq-server-setup \
>             "
>
>  SRC_URI[md5sum] = "09d1af64c005bc680d6790b90655d021"
> @@ -44,9 +46,17 @@ do_install() {
>      mv ${D}/ebin ${RABBIT_LIB_DIR}/ebin
>      mv ${D}/include ${RABBIT_LIB_DIR}/include
>      mv ${D}/plugins ${RABBIT_LIB_DIR}/plugins
> +
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/rabbitmq-server.service
> ${D}${systemd_unitdir}/system
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
> +       install -d ${D}${bindir}
> +       install -m 0755 ${WORKDIR}/rabbitmq-server-setup ${D}${bindir}
> +    fi
>  }
>
> -inherit useradd update-rc.d
> +inherit useradd update-rc.d systemd
>
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "--system rabbitmq"
> @@ -56,6 +66,8 @@ USERADD_PARAM_${PN}  = "--system --create-home --home
> /var/lib/rabbitmq \
>  INITSCRIPT_NAME = "rabbitmq-server"
>  INITSCRIPT_PARAMS = "defaults"
>
> +SYSTEMD_SERVICE_${PN} = "rabbitmq-server.service"
> +
>  FILES_${PN} += " ${libdir}/rabbitmq/lib/${PN}-${PV}/* \
>                   ${localstatedir}/* \
>                 "
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0e6100697d990556f50c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Thu, Aug 17, 2017 at 9:34 AM, Shrika=
nt Bobade <span dir=3D"ltr">&lt;<a href=3D"mailto:bobadeshrikant@gmail.com"=
 target=3D"_blank">bobadeshrikant@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">From: Shrikant Bobade &lt;<a href=3D"mailto:shrika=
nt_bobade@mentor.com">shrikant_bobade@mentor.com</a>&gt;<br>
<br>
add systemd support to bring-up out of box rabbitmq-server support.<br>
rabbitmq-server-setup: essential setup required by rabbitmq-server<br>
rabbitmq-server.service: systemd support service file<br>
<br>
Signed-off-by: Shrikant Bobade &lt;<a href=3D"mailto:shrikant_bobade@mentor=
.com">shrikant_bobade@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../rabbitmq/files/rabbitmq-<wbr>server-setup=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 26 ++++++++++++++++++++++<br>
=C2=A0.../rabbitmq/files/rabbitmq-<wbr>server.service=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 13 +++++++++++<br>
=C2=A0.../rabbitmq/<a href=3D"http://rabbitmq-server_3.2.4.bb" rel=3D"noref=
errer" target=3D"_blank">rabbitmq-server_<wbr>3.2.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++++++-<br>
=C2=A03 files changed, 52 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 meta-openstack/recipes-<wbr>extended/rabbitmq/file=
s/<wbr>rabbitmq-server-setup<br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>extended/rabbitmq/file=
s/<wbr>rabbitmq-server.service<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>extended/rabbitmq/files/<wbr>rabbi=
tmq-server-setup b/meta-openstack/recipes-<wbr>extended/rabbitmq/files/<wbr=
>rabbitmq-server-setup<br>
new file mode 100755<br>
index 0000000..343c775<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>extended/rabbitmq/files/<wbr>rabbitmq-ser=
ver-setup<br>
@@ -0,0 +1,26 @@<br>
+#!/bin/sh<br>
+#<br>
+# rabbitmq-server-setup RabbitMQ broker setup<br>
+#<br>
+# description: To Enable AMQP server provided by RabbitMQ,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this setup required befo=
re starting rabbitmq-server.<br>
+#<br>
+##<br>
+<br>
+<br>
+# Ensure that HOME is set, since the erlang cookie file must be written<br=
>
+# somewhere<br>
+export HOME=3D/home/root<br>
+<br>
+USER=3Droot<br>
+ROTATE_SUFFIX=3D<br>
+INIT_LOG_DIR=3D/var/log/<wbr>rabbitmq<br>
+<br>
+# setup log dir and files for rabbitmq server<br>
+if [ ! -d ${INIT_LOG_DIR} ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir ${INIT_LOG_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0755 ${INIT_LOG_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chown $USER:$USER ${INIT_LOG_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${INIT_LOG_DIR}/startup_err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${INIT_LOG_DIR}/startup_log<br>
+fi<br>
diff --git a/meta-openstack/recipes-<wbr>extended/rabbitmq/files/<wbr>rabbi=
tmq-server.service b/meta-openstack/recipes-<wbr>extended/rabbitmq/files/<w=
br>rabbitmq-server.service<br>
new file mode 100644<br>
index 0000000..414ea50<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>extended/rabbitmq/files/<wbr>rabbitmq-ser=
ver.service<br>
@@ -0,0 +1,13 @@<br>
+[Unit]<br>
+Description=3DRabbitMQ Messaging broker/server service<br>
+After=3Dnetwork.target<br>
+<br>
+[Service]<br>
+Type=3Dsimple<br>
+User=3Droot<br>
+ExecStartPre=3D/usr/bin/<wbr>rabbitmq-server-setup<br>
+ExecStart=3D/usr/bin/rabbitmq-<wbr>server<br>
+ExecStop=3D/usr/bin/rabbitmqctl stop<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta-openstack/recipes-<wbr>extended/rabbitmq/<a href=3D"http:=
//rabbitmq-server_3.2.4.bb" rel=3D"noreferrer" target=3D"_blank">rabbitmq-<=
wbr>server_3.2.4.bb</a> b/meta-openstack/recipes-<wbr>extended/rabbitmq/<a =
href=3D"http://rabbitmq-server_3.2.4.bb" rel=3D"noreferrer" target=3D"_blan=
k">rabbitmq-<wbr>server_3.2.4.bb</a><br>
index 101d098..8e4be5f 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/rabbitmq/<a href=3D"http://rabbi=
tmq-server_3.2.4.bb" rel=3D"noreferrer" target=3D"_blank">rabbitmq-<wbr>ser=
ver_3.2.4.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/rabbitmq/<a href=3D"http://rabbi=
tmq-server_3.2.4.bb" rel=3D"noreferrer" target=3D"_blank">rabbitmq-<wbr>ser=
ver_3.2.4.bb</a><br>
@@ -10,6 +10,8 @@ SRC_URI =3D &quot;<a href=3D"http://www.rabbitmq.com/rele=
ases/rabbitmq-server/v${PV}/${PN}-${PV}.t" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.rabbitmq.com/<wbr>releases/rabbitmq-server/v${<wbr>PV}/${PN=
}-${PV}.t</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rabbitmq-server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://remove-docs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cleanup_install.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rabbitmq-server.service \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rabbitmq-server-setup \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>09d1af64c005bc680d6790b90655d0<wbr>21&=
quot;<br>
@@ -44,9 +46,17 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0mv ${D}/ebin ${RABBIT_LIB_DIR}/ebin<br>
=C2=A0 =C2=A0 =C2=A0mv ${D}/include ${RABBIT_LIB_DIR}/include<br>
=C2=A0 =C2=A0 =C2=A0mv ${D}/plugins ${RABBIT_LIB_DIR}/plugins<br>
+<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/rabbitmq-server.<wbr>service ${D}=
${systemd_unitdir}/system<br>
+<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;,&#39;=
systemd&#39;,&#39;true&#39;,&#39;<wbr>false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/rabbitmq-server-<wbr=
>setup ${D}${bindir}<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-inherit useradd update-rc.d<br>
+inherit useradd update-rc.d systemd<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0GROUPADD_PARAM_${PN} =3D &quot;--system rabbitmq&quot;<br>
@@ -56,6 +66,8 @@ USERADD_PARAM_${PN}=C2=A0 =3D &quot;--system --create-hom=
e --home /var/lib/rabbitmq \<br>
=C2=A0INITSCRIPT_NAME =3D &quot;rabbitmq-server&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;defaults&quot;<br>
<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;rabbitmq-server.service&quot;<br>
+<br>
=C2=A0FILES_${PN} +=3D &quot; ${libdir}/rabbitmq/lib/${PN}-$<wbr>{PV}/* \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstate=
dir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div></div>

--94eb2c0e6100697d990556f50c85--
