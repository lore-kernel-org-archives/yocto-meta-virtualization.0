Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6541E00A9C; Tue, 21 Nov 2017 12:08:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.180 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19EBFE006CA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:08:25 -0800 (PST)
Received: by mail-qt0-f180.google.com with SMTP id p44so20849790qtj.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=puXezhj3xUahcLA5cMbLU9UgKGKzmpZPg2l3g9Ihrpg=;
	b=n0B+Zdu7SQPhzA38wxy88dHRusLBoQa6RTJo4ChPAgzCqh0EG2RiUr8YelPjUQAPrh
	KhNqrTzBvFqrcUG7FtBGCJ8xpLqDiVcTRXrH+TwWQrDG952ARUvTRQfXeMMBVlBhGT3Y
	5lPNd/6jfRUl1M0n2UeY9SgAf73tfew5Nm8yTPP6zCljeGdoAlcrkN0FufDEpQBkD7OK
	tt+fd+j6Mx5YBSj5YudfEEuKRjf2mioBZYL9HL7wrxzvb01wR0cEfd0abjiI7cXChNrx
	eBxVbGyEYv1zBb4cbD4NgDSyxo5KpGg9TkrnOQfWK/K+F03ViHNEb9KSmEoq9PTU+zhR
	krnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=puXezhj3xUahcLA5cMbLU9UgKGKzmpZPg2l3g9Ihrpg=;
	b=VFqtdKGv4pi+C9Bz5f2aB4PMKNeIsybBWmXREyUE1C+FDuS5VDUHQUXV9KMsOZJtje
	1qv60nnB64fdgJfpzR0Q33ZJ7Faa3vA0Gpj41AgrJ5nUgggak6Xh+z9lD+dkqCtzoauX
	qIbc3MvMYGBspgf85zJzm4Zyv6xljnAVf26yZiy0PgOSz0UI6huKXyXyw+o+1/bQ/osN
	dF9zEO2RabaKf2bHY4hkp7k5XIsOdZdkxPIIhAxeFgtYxKYoYXk5kOonxxa2CWLS+q3+
	zZS62ludvXsmAHivyFO9PXsNLchjgMZU5/zMucSmJXIs0mCWEA3nS1GZTXO2P5Qk47fB
	ri6Q==
X-Gm-Message-State: AJaThX5AJ4+oErqLVHT8hPvCYT5vpFkP99B+steFSWpgmltOJhCoxut4
	UQL/+ERgHgpPar15hIE82rlmbE2wRv4e+iJsDoE=
X-Google-Smtp-Source: AGs4zMYTZTDER+KdbgsvPpJZHvCP3ycqcnf+graa3wbmxngz9SPh7hkevQhxveIwDrogDqJiDdRB8WayYmIuRy8cKyc=
X-Received: by 10.200.41.249 with SMTP id 54mr29725711qtt.312.1511294905003;
	Tue, 21 Nov 2017 12:08:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Tue, 21 Nov 2017 12:08:24 -0800 (PST)
In-Reply-To: <1511194599-30533-1-git-send-email-mark.asselstine@windriver.com>
References: <1511194599-30533-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Nov 2017 15:08:24 -0500
Message-ID: <CADkTA4Pn3w5Y8U_QZ61n7yHG7cA19oNn0rVhW+tn2FWxriH4cQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-debtcollector: uprev to v1.17.1
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
X-List-Received-Date: Tue, 21 Nov 2017 20:08:27 -0000
Content-Type: multipart/alternative; boundary="001a113f49b4f6c85e055e83c372"

--001a113f49b4f6c85e055e83c372
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Nov 20, 2017 at 11:16 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Although the current version is OK as far as dependent
> requirements.txt there appears to be some issues with the older
> version. The uprev is due, so let's get to it.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...{python-debtcollector_1.10.0.bb => python-debtcollector_1.17.1.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-
> debtcollector_1.10.0.bb => python-debtcollector_1.17.1.bb} (79%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> debtcollector_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-
> debtcollector_1.17.1.bb
> similarity index 79%
> rename from meta-openstack/recipes-devtools/python/python-
> debtcollector_1.10.0.bb
> rename to meta-openstack/recipes-devtools/python/python-
> debtcollector_1.17.1.bb
> index d53960c..8d74ace 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> debtcollector_1.10.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-
> debtcollector_1.17.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=
> 0835ade698e0bcf8506ecda2f7b4f302"
>
> -SRC_URI[md5sum] = "c85d9e0e7d4d00577695214cb425c5b4"
> -SRC_URI[sha256sum] = "1a3bd886d6aea3775e5366d7335c85
> 6449144c0218209af6c660f6be111714a3"
> +SRC_URI[md5sum] = "d43a2733f02549628fe9f716363a5b01"
> +SRC_URI[sha256sum] = "1f751d74789baa82684f55bececf75
> 4ebff1ad40e3fb1bee44fcf5c25a31e92d"
>
>  inherit setuptools pypi
>
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

--001a113f49b4f6c85e055e83c372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Nov 20, 2017 at 11:16 A=
M, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Although the current version is=
 OK as far as dependent<br>
requirements.txt there appears to be some issues with the older<br>
version. The uprev is due, so let&#39;s get to it.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://python-debtcollector_1.10.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python-debtcollector_1.10.<wbr>0.bb</a> =3D&gt; <a hr=
ef=3D"http://python-debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_=
blank">python-debtcollector_1.17.1.bb</a><wbr>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"http:/=
/python-debtcollector_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-<wbr>debtcollector_1.10.0.bb</a> =3D&gt; <a href=3D"http://python-debtcol=
lector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-debtcollector=
_1.17.1.bb</a><wbr>} (79%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-debtcollector_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
-<wbr>debtcollector_1.10.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/py=
thon/<a href=3D"http://python-debtcollector_1.17.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-<wbr>debtcollector_1.17.1.bb</a><br>
similarity index 79%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-debtcollector_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python-=
<wbr>debtcollector_1.10.0.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<w=
br>debtcollector_1.17.1.bb</a><br>
index d53960c..8d74ace 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
debtcollector_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>d=
ebtcollector_1.10.0.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
debtcollector_1.17.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>d=
ebtcollector_1.17.1.bb</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/<wbr>MIT;md5=
=3D<wbr>0835ade698e0bcf8506ecda2f7b4f3<wbr>02&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>c85d9e0e7d4d00577695214cb425c5<wbr>b4&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>1a3bd886d6aea3775e5366d7335c85<wbr>64491=
44c0218209af6c660f6be1117<wbr>14a3&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>d43a2733f02549628fe9f716363a5b<wbr>01&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>1f751d74789baa82684f55bececf75<wbr>4ebff=
1ad40e3fb1bee44fcf5c25a31<wbr>e92d&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
</div>

--001a113f49b4f6c85e055e83c372--
