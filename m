Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E752E007B5; Mon,  1 Feb 2016 12:34:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 517B3E0073D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Feb 2016 12:34:36 -0800 (PST)
Received: by mail-vk0-f67.google.com with SMTP id e64so5310465vkg.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Feb 2016 12:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UlFYvb4Zf3BJqe26LNCJx+XSSqsu96HbbSlOcBHrLXw=;
	b=l//glJ0SK+DLVJg+46v/pk+FrD0fq+r4uz6NWU0r7umrFqCgcLPKFM1YiNiYpYWX6v
	/dVFVgxD3+r5rKhTRewCnHbycbq1kpEFdI9IoVDEnFDRcXz4dF0fF4uFvO3S5OTVhR0U
	ukXtciQgg/1oYSYzuv8XWqL4ShgFYMC3flFIQkmz6OaPXL/TPnoCTRcmHqnyS1Bo56wO
	pSUlOruh5nDXw8b05iYZmWIzQwgZQR0pfJLG4lOmDqYiAyBvsfSbjOszp1A98CJEpf2d
	t/vQIWNRbgvV3fmmt/vlN4BrtWf5/tzUUgSBm/f9H4iZZSrmbhSY+b6qz8ZNvrpHP/Yz
	0BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=UlFYvb4Zf3BJqe26LNCJx+XSSqsu96HbbSlOcBHrLXw=;
	b=BFK1259nuofkzOn4YUyzrxocihMpv1eNiAIbfBJlCDC2p2NJY1yTIPtEYTYzfXoi56
	ruHBoOEm3YhD5eLBfJlTOHAEAW8CL4PS239EdadIpyjgoT4Jrw063q+KzQIluyty6EMD
	z9C+nM8upIX+QFqr/KA209g1EtjD86gcr5FDnBnkzIGN5HqFvMRhG/KYGckXcaqq+INu
	bnhosCwaeYRIJzThqiqj4yvmtKys9cmQGVV011BTslLQ3HqUttG0hl7+/QBblr+VC3W2
	bHTuGwIC8ZFBLgCC4WKZWq4m53oGOoq47s3tR+hllo1SatTTUn6mb2JO9ZW1G8pFGd7D
	drMw==
X-Gm-Message-State: AG10YOQphs8hwbnDJrrb0e6YozbUipQK8YQanWJnlAV3eMnLZo3Gty51GkD9YAJRzphd7eGjtIA6w2Nm7PiXog==
MIME-Version: 1.0
X-Received: by 10.31.172.135 with SMTP id v129mr16377032vke.154.1454358876313; 
	Mon, 01 Feb 2016 12:34:36 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 1 Feb 2016 12:34:36 -0800 (PST)
In-Reply-To: <1454345663-31312-1-git-send-email-mbgrego@tycho.nsa.gov>
References: <1454345663-31312-1-git-send-email-mbgrego@tycho.nsa.gov>
Date: Mon, 1 Feb 2016 15:34:36 -0500
Message-ID: <CADkTA4N4SySEE-M9bkrBd0eArAT31hP8BGS7Q7v3Z8-62F0pow@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Machon Gregory <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] Allow xsm to be built with GCC 5.1.1 and greater
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
X-List-Received-Date: Mon, 01 Feb 2016 20:34:39 -0000
Content-Type: multipart/alternative; boundary=001a1143e3dc32dcea052abb50c4

--001a1143e3dc32dcea052abb50c4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

merged to master and jethro.

Bruce

On Mon, Feb 1, 2016 at 11:54 AM, Machon Gregory <mbgrego@tycho.nsa.gov>
wrote:

> The patch was cherrypicked from upstream Xen. See patch header for more
> information.
>
> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> ---
>  ...e-p-policyvers-be-a-local-variable-ver-to.patch | 122
> +++++++++++++++++++++
>  recipes-extended/xen/xen_4.6.0.bb                  |   1 +
>  2 files changed, 123 insertions(+)
>  create mode 100644
> recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-=
ver-to.patch
>
> diff --git
> a/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variabl=
e-ver-to.patch
> b/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variabl=
e-ver-to.patch
> new file mode 100644
> index 0000000..efe6e74
> --- /dev/null
> +++
> b/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variabl=
e-ver-to.patch
> @@ -0,0 +1,122 @@
> +From 6a2f81459e1455d65a9a6f78dd2a0d0278619680 Mon Sep 17 00:00:00 2001
> +From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> +Date: Wed, 16 Sep 2015 15:57:27 -0400
> +Subject: [PATCH] xen/xsm: Make p->policyvers be a local variable (ver) t=
o
> shut
> + up GCC 5.1.1 warnings.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +policydb.c: In function =E2=80=98user_read=E2=80=99:
> +policydb.c:1443:26: error: =E2=80=98buf[2]=E2=80=99 may be used uninitia=
lized in this
> function [-Werror=3Dmaybe-uninitialized]
> +         usrdatum->bounds =3D le32_to_cpu(buf[2]);
> +                          ^
> +cc1: all warnings being treated as errors
> +
> +Which (as Andrew mentioned) is because GCC cannot assume
> +that 'p->policyvers' has the same value between checks.
> +
> +We make it local, optimize the name to 'ver' and the warnings go away.
> +We also update another call site with this modification to
> +make it more inline with the rest of the functions.
> +
> +Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> +Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> +---
> + xen/xsm/flask/ss/policydb.c | 17 ++++++++++-------
> + 1 file changed, 10 insertions(+), 7 deletions(-)
> +
> +diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
> +index a1060b1..eebfe9c 100644
> +--- a/xen/xsm/flask/ss/policydb.c
> ++++ b/xen/xsm/flask/ss/policydb.c
> +@@ -1258,6 +1258,7 @@ static int role_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +     int rc;
> +     __le32 buf[3];
> +     u32 len;
> ++    u32 ver =3D p->policyvers;
> +
> +     role =3D xzalloc(struct role_datum);
> +     if ( !role )
> +@@ -1266,7 +1267,7 @@ static int role_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +         goto out;
> +     }
> +
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_BOUNDARY )
> ++    if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
> +         rc =3D next_entry(buf, fp, sizeof(buf[0]) * 3);
> +     else
> +         rc =3D next_entry(buf, fp, sizeof(buf[0]) * 2);
> +@@ -1276,7 +1277,7 @@ static int role_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +
> +     len =3D le32_to_cpu(buf[0]);
> +     role->value =3D le32_to_cpu(buf[1]);
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_BOUNDARY )
> ++    if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
> +         role->bounds =3D le32_to_cpu(buf[2]);
> +
> +     key =3D xmalloc_array(char, len + 1);
> +@@ -1328,6 +1329,7 @@ static int type_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +     int rc;
> +     __le32 buf[4];
> +     u32 len;
> ++    u32 ver =3D p->policyvers;
> +
> +     typdatum =3D xzalloc(struct type_datum);
> +     if ( !typdatum )
> +@@ -1336,7 +1338,7 @@ static int type_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +         return rc;
> +     }
> +
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_BOUNDARY )
> ++    if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
> +         rc =3D next_entry(buf, fp, sizeof(buf[0]) * 4);
> +     else
> +         rc =3D next_entry(buf, fp, sizeof(buf[0]) * 3);
> +@@ -1346,7 +1348,7 @@ static int type_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +
> +     len =3D le32_to_cpu(buf[0]);
> +     typdatum->value =3D le32_to_cpu(buf[1]);
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_BOUNDARY )
> ++    if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
> +     {
> +         u32 prop =3D le32_to_cpu(buf[2]);
> +
> +@@ -1421,6 +1423,7 @@ static int user_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +     int rc;
> +     __le32 buf[3];
> +     u32 len;
> ++    u32 ver =3D p->policyvers;
> +
> +     usrdatum =3D xzalloc(struct user_datum);
> +     if ( !usrdatum )
> +@@ -1429,7 +1432,7 @@ static int user_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +         goto out;
> +     }
> +
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_BOUNDARY )
> ++    if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
> +         rc =3D next_entry(buf, fp, sizeof(buf[0]) * 3);
> +     else
> +         rc =3D next_entry(buf, fp, sizeof(buf[0]) * 2);
> +@@ -1439,7 +1442,7 @@ static int user_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +
> +     len =3D le32_to_cpu(buf[0]);
> +     usrdatum->value =3D le32_to_cpu(buf[1]);
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_BOUNDARY )
> ++    if ( ver >=3D POLICYDB_VERSION_BOUNDARY )
> +         usrdatum->bounds =3D le32_to_cpu(buf[2]);
> +
> +     key =3D xmalloc_array(char, len + 1);
> +@@ -1457,7 +1460,7 @@ static int user_read(struct policydb *p, struct
> hashtab *h, void *fp)
> +     if ( rc )
> +         goto bad;
> +
> +-    if ( p->policyvers >=3D POLICYDB_VERSION_MLS )
> ++    if ( ver >=3D POLICYDB_VERSION_MLS )
> +     {
> +         rc =3D mls_read_range_helper(&usrdatum->range, fp);
> +         if ( rc )
> +--
> +2.1.0
> +
> diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/
> xen_4.6.0.bb
> index 41241cd..7650e46 100644
> --- a/recipes-extended/xen/xen_4.6.0.bb
> +++ b/recipes-extended/xen/xen_4.6.0.bb
> @@ -2,6 +2,7 @@ require xen.inc
>
>  SRC_URI =3D " \
>      http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> +    file://xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch \
>      "
>
>  SRC_URI[md5sum] =3D "48e232f90927c08326a7b52bb06f49bc"
> --
> 2.1.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143e3dc32dcea052abb50c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged to master and jethro.<br><br></div><div>Bruce<=
br></div><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Mon, Feb 1, 2016 at 11:54 AM, Machon Gregory <span dir=3D"ltr">&lt;<a =
href=3D"mailto:mbgrego@tycho.nsa.gov" target=3D"_blank">mbgrego@tycho.nsa.g=
ov</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The patch was ch=
errypicked from upstream Xen. See patch header for more information.<br>
<br>
Signed-off-by: Machon Gregory &lt;<a href=3D"mailto:mbgrego@tycho.nsa.gov">=
mbgrego@tycho.nsa.gov</a>&gt;<br>
---<br>
=C2=A0...e-p-policyvers-be-a-local-variable-ver-to.patch | 122 ++++++++++++=
+++++++++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 123 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/xen/files/xen-xsm-Make-p-policyve=
rs-be-a-local-variable-ver-to.patch<br>
<br>
diff --git a/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-loca=
l-variable-ver-to.patch b/recipes-extended/xen/files/xen-xsm-Make-p-policyv=
ers-be-a-local-variable-ver-to.patch<br>
new file mode 100644<br>
index 0000000..efe6e74<br>
--- /dev/null<br>
+++ b/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-varia=
ble-ver-to.patch<br>
@@ -0,0 +1,122 @@<br>
+From 6a2f81459e1455d65a9a6f78dd2a0d0278619680 Mon Sep 17 00:00:00 2001<br>
+From: Konrad Rzeszutek Wilk &lt;<a href=3D"mailto:konrad.wilk@oracle.com">=
konrad.wilk@oracle.com</a>&gt;<br>
+Date: Wed, 16 Sep 2015 15:57:27 -0400<br>
+Subject: [PATCH] xen/xsm: Make p-&gt;policyvers be a local variable (ver) =
to shut<br>
+ up GCC 5.1.1 warnings.<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+policydb.c: In function =E2=80=98user_read=E2=80=99:<br>
+policydb.c:1443:26: error: =E2=80=98buf[2]=E2=80=99 may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usrdatum-&gt;bounds =3D le32_to_cpu(buf[=
2]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^<br>
+cc1: all warnings being treated as errors<br>
+<br>
+Which (as Andrew mentioned) is because GCC cannot assume<br>
+that &#39;p-&gt;policyvers&#39; has the same value between checks.<br>
+<br>
+We make it local, optimize the name to &#39;ver&#39; and the warnings go a=
way.<br>
+We also update another call site with this modification to<br>
+make it more inline with the rest of the functions.<br>
+<br>
+Signed-off-by: Konrad Rzeszutek Wilk &lt;<a href=3D"mailto:konrad.wilk@ora=
cle.com">konrad.wilk@oracle.com</a>&gt;<br>
+Acked-by: Daniel De Graaf &lt;<a href=3D"mailto:dgdegra@tycho.nsa.gov">dgd=
egra@tycho.nsa.gov</a>&gt;<br>
+---<br>
+ xen/xsm/flask/ss/policydb.c | 17 ++++++++++-------<br>
+ 1 file changed, 10 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c<br>
+index a1060b1..eebfe9c 100644<br>
+--- a/xen/xsm/flask/ss/policydb.c<br>
++++ b/xen/xsm/flask/ss/policydb.c<br>
+@@ -1258,6 +1258,7 @@ static int role_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0int rc;<br>
+=C2=A0 =C2=A0 =C2=A0__le32 buf[3];<br>
+=C2=A0 =C2=A0 =C2=A0u32 len;<br>
++=C2=A0 =C2=A0 u32 ver =3D p-&gt;policyvers;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0role =3D xzalloc(struct role_datum);<br>
+=C2=A0 =C2=A0 =C2=A0if ( !role )<br>
+@@ -1266,7 +1267,7 @@ static int role_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_BOUNDARY )<b=
r>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D next_entry(buf, fp, sizeof(buf[0]=
) * 3);<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D next_entry(buf, fp, sizeof(buf[0]=
) * 2);<br>
+@@ -1276,7 +1277,7 @@ static int role_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0len =3D le32_to_cpu(buf[0]);<br>
+=C2=A0 =C2=A0 =C2=A0role-&gt;value =3D le32_to_cpu(buf[1]);<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_BOUNDARY )<b=
r>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0role-&gt;bounds =3D le32_to_cpu(buf[2]);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0key =3D xmalloc_array(char, len + 1);<br>
+@@ -1328,6 +1329,7 @@ static int type_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0int rc;<br>
+=C2=A0 =C2=A0 =C2=A0__le32 buf[4];<br>
+=C2=A0 =C2=A0 =C2=A0u32 len;<br>
++=C2=A0 =C2=A0 u32 ver =3D p-&gt;policyvers;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0typdatum =3D xzalloc(struct type_datum);<br>
+=C2=A0 =C2=A0 =C2=A0if ( !typdatum )<br>
+@@ -1336,7 +1338,7 @@ static int type_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_BOUNDARY )<b=
r>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D next_entry(buf, fp, sizeof(buf[0]=
) * 4);<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D next_entry(buf, fp, sizeof(buf[0]=
) * 3);<br>
+@@ -1346,7 +1348,7 @@ static int type_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0len =3D le32_to_cpu(buf[0]);<br>
+=C2=A0 =C2=A0 =C2=A0typdatum-&gt;value =3D le32_to_cpu(buf[1]);<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_BOUNDARY )<b=
r>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 prop =3D le32_to_cpu(buf[2]);<br>
+<br>
+@@ -1421,6 +1423,7 @@ static int user_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0int rc;<br>
+=C2=A0 =C2=A0 =C2=A0__le32 buf[3];<br>
+=C2=A0 =C2=A0 =C2=A0u32 len;<br>
++=C2=A0 =C2=A0 u32 ver =3D p-&gt;policyvers;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0usrdatum =3D xzalloc(struct user_datum);<br>
+=C2=A0 =C2=A0 =C2=A0if ( !usrdatum )<br>
+@@ -1429,7 +1432,7 @@ static int user_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_BOUNDARY )<b=
r>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D next_entry(buf, fp, sizeof(buf[0]=
) * 3);<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D next_entry(buf, fp, sizeof(buf[0]=
) * 2);<br>
+@@ -1439,7 +1442,7 @@ static int user_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0len =3D le32_to_cpu(buf[0]);<br>
+=C2=A0 =C2=A0 =C2=A0usrdatum-&gt;value =3D le32_to_cpu(buf[1]);<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_BOUNDARY )<b=
r>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_BOUNDARY )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usrdatum-&gt;bounds =3D le32_to_cpu(buf[=
2]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0key =3D xmalloc_array(char, len + 1);<br>
+@@ -1457,7 +1460,7 @@ static int user_read(struct policydb *p, struct hash=
tab *h, void *fp)<br>
+=C2=A0 =C2=A0 =C2=A0if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad;<br>
+<br>
+-=C2=A0 =C2=A0 if ( p-&gt;policyvers &gt;=3D POLICYDB_VERSION_MLS )<br>
++=C2=A0 =C2=A0 if ( ver &gt;=3D POLICYDB_VERSION_MLS )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D mls_read_range_helper(&amp;usrdat=
um-&gt;range, fp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( rc )<br>
+--<br>
+2.1.0<br>
+<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.6.0.bb" rel=3D"no=
referrer" target=3D"_blank">xen_4.6.0.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.6.0.bb<=
/a><br>
index 41241cd..7650e46 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.0.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.0.bb</a><br>
@@ -2,6 +2,7 @@ require xen.inc<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://bits.xensource.com/oss-xen/release/${=
PV}/xen-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://bits.xens=
ource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 file://xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;48e232f90927c08326a7b52bb06f49bc&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.0<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div></div></div>

--001a1143e3dc32dcea052abb50c4--
