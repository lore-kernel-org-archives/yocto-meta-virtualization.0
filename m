Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2EDB0E009AD; Wed, 25 Jan 2017 11:30:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.169 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06667E00985
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 11:30:41 -0800 (PST)
Received: by mail-qt0-f169.google.com with SMTP id l7so34632323qtd.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 11:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uGgf8kOdRXY1/Wv131FTfcU2icvVi7uzU6goOvLQ1x0=;
	b=jtfahlT3vjYP7HhrxmCCfSKMLFijmt9aEZeTxMipZvhwzvuw10qmI4UWCdAa+P1l+k
	3ROosJhBmnEfH3Wa+eN0iNQhluuxnP2dGNE0WIhDQIXkGoFCuW+YhYTYjh1OsO5Nrx8A
	mwutsH6U6rZZkJEx5/zrby/+KSvW++YkxDQoC+XmRhFMzmUrSO7K3kXWSv/7HDRXCDFB
	OpqUXz0ciu/6yLTM8eCLI2t+N4rK9yNbLprZ3PwVPhyOTzVRaLm04EredOop8HE/JP3D
	6cxS6v9/uau7MjZJasZbDN9UicMdnM/69/uIfCU/BHFWBj+6U/Ie8UNePp0PT/dtfzfk
	vn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uGgf8kOdRXY1/Wv131FTfcU2icvVi7uzU6goOvLQ1x0=;
	b=NA9pJwJL0nFndeqbCixGtM0B7V2S6rXCZWmLP0Zuq+hg2rHx78m+Evi+9kxXUAxSsU
	iWOwgkWjhWDnAur7PImfuD5/AedkDudy1ZSTvED6m8AjI129NyEvfYBStF0xc3S6prGp
	PFiXktCj3hE5x2vgQbIFG1XuJu+1PgjeymPskgL4xQw8cOprU4PslJiow3YyKTnFzlZo
	3LjbfNrb1l06Mjv7IfoMGV4T62ipb9kl6hhTxktPEt7+m0YgwpSnqK6nTX9Gae0JMzEF
	GopaYQ49Qy8Q3QfXRb/9BtBI0dUmXCbcDoB2UV6SppaIEMnAq3nH0t07BNvLyFMpp/w9
	NU3g==
X-Gm-Message-State: AIkVDXJnrM43eMmGyrdLUVyegt5MSELsVszLQjD3sVxMQtD2d1CjnPt5Aj/lEUJVlh8OnUG7ur0gpU1bBHry+w==
X-Received: by 10.237.42.196 with SMTP id t62mr37422376qtd.185.1485372640773; 
	Wed, 25 Jan 2017 11:30:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Wed, 25 Jan 2017 11:30:40 -0800 (PST)
In-Reply-To: <1485308908-2189-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1485308908-2189-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Jan 2017 14:30:40 -0500
Message-ID: <CADkTA4Ok43wcueCrL_=60osLMi+N1sqQTOtPmYfrOp2Xyz1Ueg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-warlock: 1.1.0 -> 1.3.0
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
X-List-Received-Date: Wed, 25 Jan 2017 19:30:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e1e9ccc760546f0441c

--94eb2c122e1e9ccc760546f0441c
Content-Type: text/plain; charset=UTF-8

All outstanding uprevs should now be merged. Double check your queue
against master and re-send anything that I missed.

Cheers,

Bruce

On Tue, Jan 24, 2017 at 8:48 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade python-warlock from 1.1.0 to 1.3.0.
> 2) Change the license file to LICENSE.txt.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-warlock_1.1.0.bb | 21
> ---------------------
>  .../recipes-devtools/python/python-warlock_1.3.0.bb | 21
> +++++++++++++++++++++
>  2 files changed, 21 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-
> warlock_1.1.0.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python-
> warlock_1.3.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> warlock_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-
> warlock_1.1.0.bb
> deleted file mode 100644
> index 49f1390..0000000
> --- a/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "Build self-validating python objects using JSON schemas"
> -HOMEPAGE = "http://github.com/bcwaldon/warlock"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM = "file://README.md;md5=97b002bcda83d22e7d3fd1427688a6
> a6"
> -
> -DEPENDS += "python-jsonschema python-jsonpatch"
> -
> -SRCNAME = "warlock"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "79649fd8096eeb0c175a193f06237676"
> -SRC_URI[sha256sum] = "bbfb4279034ccc402723e38d2a2e67
> cd619988bf4802fda7ba3e8fab15762651"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
> -
> diff --git a/meta-openstack/recipes-devtools/python/python-
> warlock_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-
> warlock_1.3.0.bb
> new file mode 100644
> index 0000000..6a884df
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Build self-validating python objects using JSON schemas"
> +HOMEPAGE = "http://github.com/bcwaldon/warlock"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd
> 57"
> +
> +DEPENDS += "python-jsonschema python-jsonpatch"
> +
> +SRCNAME = "warlock"
> +
> +SRC_URI = "https://pypi.python.org/packages/2d/40/
> 9f01a5e1574dab946598793351d59c86f58209d182d229aaa545abb98894
> /${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "61cc809a3af2c76288f4dd26a003932d"
> +SRC_URI[sha256sum] = "d7403f728fce67ee2f22f3d7fa09c9
> de0bc95c3e7bcf6005b9c1962b77976a06"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
> +
> --
> 2.7.4
>
>
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

--94eb2c122e1e9ccc760546f0441c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>All outstanding uprevs should now be merged. Dou=
ble check your queue against master and re-send anything that I missed.<br>=
<br></div>Cheers,<br><br></div>Bruce<br></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Tue, Jan 24, 2017 at 8:48 PM, Huang Qiyu <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=
=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">1) Upgrade python-warlock from 1.1.0 to 1.3.0.<br>
2) Change the license file to LICENSE.txt.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-warlock_1.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-warlock_1.1.0.bb</a> | 2=
1 ---------------------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-warlock_1.3.0.bb=
" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-warlock_1.3.0.bb</a> | 2=
1 +++++++++++++++++++++<br>
=C2=A02 files changed, 21 insertions(+), 21 deletions(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-<wbr>devtools/python/<a hre=
f=3D"http://python-warlock_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-<wbr>warlock_1.1.0.bb</a><br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>devtools/python/<a hre=
f=3D"http://python-warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-<wbr>warlock_1.3.0.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-warlock_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>w=
arlock_1.1.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-warlock_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-<wbr>warlock_1.1.0.bb</a><br>
deleted file mode 100644<br>
index 49f1390..0000000<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
warlock_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>warlock_=
1.1.0.bb</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-DESCRIPTION =3D &quot;Build self-validating python objects using JSON sche=
mas&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://github.com/bcwaldon/warlock" rel=3D"n=
oreferrer" target=3D"_blank">http://github.com/bcwaldon/<wbr>warlock</a>&qu=
ot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://README.md;md5=3D<wbr>97b002bcda83d22e7d3=
fd1427688a6<wbr>a6&quot;<br>
-<br>
-DEPENDS +=3D &quot;python-jsonschema python-jsonpatch&quot;<br>
-<br>
-SRCNAME =3D &quot;warlock&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/w/${SR=
CNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:/=
/pypi.python.org/<wbr>packages/source/w/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.ta=
r.gz</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>79649fd8096eeb0c175a193f062376<wbr>76&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>bbfb4279034ccc402723e38d2a2e67<wbr>cd619=
988bf4802fda7ba3e8fab1576<wbr>2651&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
-<br>
-inherit setuptools<br>
-<br>
-RDEPENDS_${PN} +=3D &quot; python-jsonschema python-jsonpatch&quot;<br>
-<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>w=
arlock_1.3.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-<wbr>warlock_1.3.0.bb</a><br>
new file mode 100644<br>
index 0000000..6a884df<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>warlock_=
1.3.0.bb</a><br>
@@ -0,0 +1,21 @@<br>
+DESCRIPTION =3D &quot;Build self-validating python objects using JSON sche=
mas&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://github.com/bcwaldon/warlock" rel=3D"n=
oreferrer" target=3D"_blank">http://github.com/bcwaldon/<wbr>warlock</a>&qu=
ot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D<wbr>3b83ef96387f14655=
fc854ddc3c6bd<wbr>57&quot;<br>
+<br>
+DEPENDS +=3D &quot;python-jsonschema python-jsonpatch&quot;<br>
+<br>
+SRCNAME =3D &quot;warlock&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/2d/40/9f01a5=
e1574dab946598793351d59c86f58209d182d229aaa545abb98894/${SRCNAME}-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/<wbr>pack=
ages/2d/40/<wbr>9f01a5e1574dab946598793351d59c<wbr>86f58209d182d229aaa545ab=
b98894<wbr>/${SRCNAME}-${PV}.tar.gz</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>61cc809a3af2c76288f4dd26a00393<wbr>2d&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>d7403f728fce67ee2f22f3d7fa09c9<wbr>de0bc=
95c3e7bcf6005b9c1962b7797<wbr>6a06&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
+<br>
+inherit setuptools<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; python-jsonschema python-jsonpatch&quot;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c122e1e9ccc760546f0441c--
