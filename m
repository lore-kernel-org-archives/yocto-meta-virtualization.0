Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CEDDE010CD; Wed,  7 Sep 2016 13:07:55 -0700 (PDT)
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
	*      [209.85.220.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F199EE010C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 13:07:53 -0700 (PDT)
Received: by mail-qk0-f172.google.com with SMTP id v123so26517469qkh.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Sep 2016 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VhSkI5WHH3LNu6twdZILTLtf8ZCpeoOUf7dZIiyMTHo=;
	b=yBkHE6FqjPEHR5hgCfK7tiLWQXR0bDroiCl/FtYNwKe6ZIMwXd/ADmaAKB7i9CPFk+
	kJgs7dkdzwC/qSDRXRf2JEGXeUZE15B/njhtwpb+w54B0hwrXzTQXtMFxn+zRqEn9xpp
	Q2XvnRYe0yobe3bBftzN5bLVXas+QSGdrsiBYI7N6cfh80mqkM/y+kZw8r4ALdOYsSn2
	V5zlRCpofxwopBC98l6D98QnVLyw2yAXLIVgVG5sgfiN1KOKdjtDlin0xxYESMelIz7z
	yc/xZ74HS1/S7BuiIiW0w5xOFhrPDLfT6lH4eWkXwqMwoOTeA4/eDyENMRjr7dGy55w+
	0T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VhSkI5WHH3LNu6twdZILTLtf8ZCpeoOUf7dZIiyMTHo=;
	b=VxKgAxsFakdidN6zUeJUtfrecvXc3l64TSahN16dtNL4+qkU2C4Y/GwXfmYhGAASq7
	4hzCWWAIpTM4eemBmOz+HilxVoj3CcQGUXc7aBVf4Z4oLR5yoEzcPjuBn6g0Dm95cHSV
	ZN2ahSNI7ldm1MSWlNDPf3D5JMHGc36fltHXC/uPLvLMyAwP1BVN+UlzWMOYsCUv2GVx
	hSsMaobR2xeVKhCB47b1mTs0YCinKZJA2kZjyLVWw6MdWcPqt9aEkbrK81NaXlSoDkAr
	O4mJD6/Kv9rCtcqaVZaAgLwdA1VJGdkqMqSzM/ZJU53654KGn71CYfwMwhTW+56rhsXp
	G0IQ==
X-Gm-Message-State: AE9vXwOwoCbfA21FtlDUiuEUVwxCVsBtDlzLirCDjrYbxCjwY/PbTud1Uz9cCN70M7dEyGjBkxJMprjj+vkPIA==
X-Received: by 10.55.99.17 with SMTP id x17mr14017275qkb.261.1473278872635;
	Wed, 07 Sep 2016 13:07:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Wed, 7 Sep 2016 13:07:51 -0700 (PDT)
In-Reply-To: <1473179600-29301-1-git-send-email-jason.wessel@windriver.com>
References: <1473179600-29301-1-git-send-email-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Sep 2016 16:07:51 -0400
Message-ID: <CADkTA4N1cQ6zUZwQPRZhsYSARmF24b6WkB0HKeVy7Z8WOcLUSQ@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-distribution-digest: Fix do_package failure
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
X-List-Received-Date: Wed, 07 Sep 2016 20:07:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a3c4dbeed4053bf0779a

--94eb2c05a3c4dbeed4053bf0779a
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 6, 2016 at 12:33 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The rule in the recipe which deletes all but LICENSE and the digest
> directory is broken depending on what ascii table bash uses by
> default for matching, specifically:
>
>     rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*
>
> The "A-K" piece will actually match both upper and lower case when the
> acsii because the ascii value is checked as being between two numbers:
>    0x41=a, 0x42=A,0x43=b...0x48=D
>
> This is contray to what you would typically think should work with the
> lower and uppers separated into two contiguous spaces.  To fix this,
> instead of using the "rm" logic, we can copy the components we need
> instead.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/go/go-distribution-digest_git.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-devtools/go/go-distribution-digest_git.bb
> b/recipes-devtools/go/go-distribution-digest_git.bb
> index 31d724c..2a803da 100644
> --- a/recipes-devtools/go/go-distribution-digest_git.bb
> +++ b/recipes-devtools/go/go-distribution-digest_git.bb
> @@ -13,15 +13,13 @@ SRCREV = "d957768537c5af40e4f4cd96871f7b2bde9e2923"
>
>  S = "${WORKDIR}/git"
>
> -do_unpackpost() {
> -       rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*
> +# NO-OP the do compile rule because this recipe is source only.
> +do_compile() {
>  }
>
> -addtask unpackpost after do_unpack before do_patch
> -
>  do_install() {
>         install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +       cp -r ${S}/LICENSE ${S}/digest ${D}${prefix}/local/go/src/${
> PKG_NAME}/
>  }
>
>  SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
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
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05a3c4dbeed4053bf0779a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Sep 6, 2016 at 12:33 PM=
, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriv=
er.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">The rule in the recipe which deletes all =
but LICENSE and the digest<br>
directory is broken depending on what ascii table bash uses by<br>
default for matching, specifically:<br>
<br>
=C2=A0 =C2=A0 rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*<br>
<br>
The &quot;A-K&quot; piece will actually match both upper and lower case whe=
n the<br>
acsii because the ascii value is checked as being between two numbers:<br>
=C2=A0 =C2=A00x41=3Da, 0x42=3DA,0x43=3Db...0x48=3DD<br>
<br>
This is contray to what you would typically think should work with the<br>
lower and uppers separated into two contiguous spaces.=C2=A0 To fix this,<b=
r>
instead of using the &quot;rm&quot; logic, we can copy the components we ne=
ed<br>
instead.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-distribution-digest_git.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>distribution-digest_git.bb</a>=
 | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-distribution-digest_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>distribution-digest_git=
.bb</a> b/recipes-devtools/go/<a href=3D"http://go-distribution-digest_git.=
bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>distribution-digest_git.bb=
</a><br>
index 31d724c..2a803da 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-distribution-digest_git.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>distribution-digest_git.bb</a>=
<br>
+++ b/recipes-devtools/go/<a href=3D"http://go-distribution-digest_git.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>distribution-digest_git.bb</a>=
<br>
@@ -13,15 +13,13 @@ SRCREV =3D &quot;<wbr>d957768537c5af40e4f4cd96871f7b<wb=
r>2bde9e2923&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-do_unpackpost() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*<br>
+# NO-OP the do compile rule because this recipe is source only.<br>
+do_compile() {<br>
=C2=A0}<br>
<br>
-addtask unpackpost after do_unpack before do_patch<br>
-<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${prefix}/local/go/src/${<wbr>PK=
G_NAME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/* ${D}${prefix}/local/go/src/${<wbr>=
PKG_NAME}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/LICENSE ${S}/digest ${D}${prefix}/lo=
cal/go/src/${<wbr>PKG_NAME}/<br>
=C2=A0}<br>
<br>
=C2=A0SYSROOT_PREPROCESS_FUNCS +=3D &quot;go_distribution_digeset_<wbr>sysr=
oot_preprocess&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--94eb2c05a3c4dbeed4053bf0779a--
