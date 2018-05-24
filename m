Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF1C5E006F1; Thu, 24 May 2018 13:09:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 272A1E0044F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:18 -0700 (PDT)
Received: by mail-wm0-f43.google.com with SMTP id f8-v6so8698612wmc.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TNFzJciTzKj1CTyzRr72dfaFVGQ9O82wkgNag3UjCrE=;
	b=F+s8kvEw6QU0Lc36kQ2UfA4esiUAUVnXZh+akGdpsKwzIsjiRTS2fwF/DSMjf3Xd7/
	SCgOezw84mz/ivgTJ1EL7Az+h4YkX6xrVkp7kdJhPKtXd4Ky/33kFSnskQiMly/F4EHU
	v9OucexGaQnJanRL9M0NUBVP1RMTffab1URyIw7H+yTtYtbCf8LOjKWuihkeQTda8BfO
	9AtJig7aeUDftDvA0rGOhguBjnKKmxCKqITXUFAyTtXqLUONf+aEDr5PwafeTqfJwBdO
	8FPPGsnUyV0rXjzVJaTPpsFL+ArgD8IFK12e06BmRyZ+j9c2aXYU5p+XN9w8IKRQCfT2
	SLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TNFzJciTzKj1CTyzRr72dfaFVGQ9O82wkgNag3UjCrE=;
	b=O4xbt9gKOr3ZRizemtTt4+EAf4LgHrtp2hHE0fsDx+hBMzDXNryPuuS01xEm/GZDoM
	5kchTu4l/KuuDFyy4iRkP4+mJMSvaRZSAaF9Wjv4QfG1v8LnSwcwjbzQ2NFwckdlNTUC
	5JttCRLpwdeGRoyYgpLYr1BF7hRU4jqKulsEssXDN9X3PAe4NZyrb+C+X+3TSFbmfzY/
	4dTxOG4j0JLYIPlOCGpZEr4+SQuyRDJeeT5tAE6/EnaIvZs0NKJgtyW32AmsPgpFi2Lh
	vSWUtNy9TrdHn5p65jLPtmIb+evBJlmNzgC1FOO4a2xC+x8U6N3fWCN2/rG31jgTSxI7
	XiVA==
X-Gm-Message-State: ALKqPweBXayXkdIH6dBAIHN3Pj5KF4gJg559ldTpITY6TtJbcv1r6zf2
	Dba1No7ZJ7VFGXv+OohR21+k4vZRwsw1HzjyGSU=
X-Google-Smtp-Source: AB8JxZqYMXMj3qpDs/ABETXrdr2ebEruGj33YJ7N1keQvG3hVKYhSdXwQu0BGPjmdyTtYuPqTrTiruN2S79wOctQ96g=
X-Received: by 2002:a2e:82d6:: with SMTP id
	n22-v6mr5624855ljh.142.1527192558039; 
	Thu, 24 May 2018 13:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 13:09:17 -0700 (PDT)
In-Reply-To: <20180523175044.130575-1-joe.slater@windriver.com>
References: <20180523175044.130575-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 16:09:17 -0400
Message-ID: <CADkTA4PXeSWQLpA=sN3WUhKwpwCVQsvdwkMOCq0Trk3STnhPmA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virt][m-c-s][PATCH 1/1] glusterfs: build with libtirpc
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
X-List-Received-Date: Thu, 24 May 2018 20:09:20 -0000
Content-Type: multipart/alternative; boundary="000000000000ecf993056cf939e7"

--000000000000ecf993056cf939e7
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, May 23, 2018 at 1:50 PM, Joe Slater <joe.slater@windriver.com>
wrote:

> rpc is not part of glibc 2.27.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc
> b/recipes-extended/glusterfs/glusterfs.inc
> index 0556e2a..02c8a6a 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -29,9 +29,14 @@ LIC_FILES_CHKSUM = "file://COPYING-GPLV2;md5=
> b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  inherit autotools pkgconfig distutils-base update-rc.d systemd
>
> -DEPENDS += "bison-native flex-native python-native fuse libaio libxml2
> ncurses \
> +DEPENDS += "bison-native flex-native python-native fuse libaio libtirpc
> libxml2 ncurses \
>              openssl python readline zlib liburcu util-linux glib-2.0 acl"
>
> +# rpc now comes from libtirpc instead of glibc
> +#
> +CFLAGS += "-I${STAGING_INCDIR}/tirpc"
> +LDFLAGS += " -ltirpc"
> +
>  EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
>                  ac_cv_file__etc_SuSE_release=no \
>                  ac_cv_file__etc_redhat_release=no \
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

--000000000000ecf993056cf939e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 23, 2018 at 1:50 PM=
, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"mailto:joe.slater@windriver.c=
om" target=3D"_blank">joe.slater@windriver.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">rpc is not part of glibc 2.27.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com">j=
oe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/glusterfs/<wbr>glusterfs.inc | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/glusterfs/<wbr>glusterfs.inc b/recipes-extend=
ed/glusterfs/<wbr>glusterfs.inc<br>
index 0556e2a..02c8a6a 100644<br>
--- a/recipes-extended/glusterfs/<wbr>glusterfs.inc<br>
+++ b/recipes-extended/glusterfs/<wbr>glusterfs.inc<br>
@@ -29,9 +29,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING-GPLV2;md5=3D<w=
br>b234ee4d69f5fce4486a80fdaf4a42<wbr>63 \<br>
<br>
=C2=A0inherit autotools pkgconfig distutils-base update-rc.d systemd<br>
<br>
-DEPENDS +=3D &quot;bison-native flex-native python-native fuse libaio libx=
ml2 ncurses \<br>
+DEPENDS +=3D &quot;bison-native flex-native python-native fuse libaio libt=
irpc libxml2 ncurses \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0openssl python readline zli=
b liburcu util-linux glib-2.0 acl&quot;<br>
<br>
+# rpc now comes from libtirpc instead of glibc<br>
+#<br>
+CFLAGS +=3D &quot;-I${STAGING_INCDIR}/tirpc&quot;<br>
+LDFLAGS +=3D &quot; -ltirpc&quot;<br>
+<br>
=C2=A0EXTRA_OECONF =3D &quot;ac_cv_file__etc_debian_<wbr>version=3Dno \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_file__e=
tc_SuSE_release=3D<wbr>no \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_file__e=
tc_redhat_<wbr>release=3Dno \<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
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

--000000000000ecf993056cf939e7--
