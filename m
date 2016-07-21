Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47A4BE00A07; Thu, 21 Jul 2016 07:31:19 -0700 (PDT)
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
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1463E00978
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jul 2016 07:31:17 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id u25so3851341qtb.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jul 2016 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dnGIVsCXcC97k1Iyaua6Q7VMe6x7Suhn4XsRI+AdYQs=;
	b=w7zwAGRX+Xlr4h46fUqetiaRIm9qfg+/VOyLbnhBBn1kNuEdyQEueUnrPaqgach5xa
	pPZeCQ06amcbZLvBqNkKQWUpWmGJG196V/irAIrsfudOy8x8bdassdG976uNzodVEG+6
	WcbBlq2nIXi5vpBzOtCj5cfXEiaXG+CRwvykLd61BanXUtWVcp/weItYikfoqUUs/yCc
	eZJBeG0oRyXlXYHV9NLcyHFv9BrhqsqWjIBYB+1xnVo6/G7LdR7KqQRlNKs00xFNR+HW
	Ye9u3KGde7UxYgzkf02TiUCh40LJS4vSwzlrE3e7Q6bXJjJDrO25gPH4bDRn8uHPow7k
	zm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dnGIVsCXcC97k1Iyaua6Q7VMe6x7Suhn4XsRI+AdYQs=;
	b=fIMlT+Ih801Z+S4GtJRYebVULuipkAQL8yDlrrEWHzLmGWLV7C5EZIjR7o4iEuJZpJ
	dixMRuW49gcHJ6caPSIv3Mblr4fwyTCPtfwF5ZIGuxOzE5JicRW7aN1jpx0GkPkZ7xBX
	xmWQhbto4HIMB8O1Dyazfzt/FLKpyhZpdJRef35mgb/aoLEfgj2QLJjzhuK3vDva8jDN
	DvJfCskZWUPLgzrRN+zNorOORvISgx6OEOdPFcb0sNMa/60LJOJizCqQQ5OJ81xEvA7P
	bGP7pxPZmAUaheS8avGqb4Dizg50RvA9U7XZr/qfQaEpJPXBCAjJ7/zvZfah9ESZMGNg
	53JA==
X-Gm-Message-State: ALyK8tL6Pxl+NF7aJTxia671ERSwtueWoY9eK7NRebUH19MpFZZME5Ni7ijmJfkrEnetAfJRgzbfpLJShCZwXw==
X-Received: by 10.200.45.8 with SMTP id n8mr81352803qta.57.1469111467871; Thu,
	21 Jul 2016 07:31:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Thu, 21 Jul 2016 07:31:06 -0700 (PDT)
In-Reply-To: <1468610872-14309-1-git-send-email-collin.richards@ni.com>
References: <1468610872-14309-1-git-send-email-collin.richards@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Jul 2016 10:31:06 -0400
Message-ID: <CADkTA4MGppWNiK31J4E2ibgeTdJLz6iO1L10JyoJP7qza1QSNQ@mail.gmail.com>
To: Collin Richards <collin.richards@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] salt-tests: Disable staticdev QAWarning
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
X-List-Received-Date: Thu, 21 Jul 2016 14:31:19 -0000
Content-Type: multipart/alternative; boundary=001a1149dab2332fd90538262b8f

--001a1149dab2332fd90538262b8f
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 15, 2016 at 3:27 PM, Collin Richards <collin.richards@ni.com>
wrote:

> The salt-test package uses files with .a extensions in it's tests. These
> are used in tests that inspect the tree structure of the file system and
> have nothing to do with static libraries.
>
> This triggers an OE QAWarning. Skip the staticdev check for this package
> to disable this warning.
>

merged.

Bruce


>
> Signed-off-by: Collin Richards <collin.richards@ni.com>
> Natinst-ReviewBoard-ID: 145293
> ---
>  meta-openstack/recipes-support/salt/salt_2016.3.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> index a99296a..7024f42 100644
> --- a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> +++ b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
> @@ -35,6 +35,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools update-rc.d
>
> +# Avoid a QA Warning triggered by the test package including a file
> +# with a .a extension
> +INSANE_SKIP_${PN}-tests += "staticdev"
> +
>  # Note ${PN}-tests must be before ${PN}-common in the PACKAGES variable
>  # in order for ${PN}-tests to own the correct FILES.
>  PACKAGES += "\
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

--001a1149dab2332fd90538262b8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jul 15, 2016 at 3:27 PM, Collin Richards <span dir=3D"ltr">&lt;=
<a href=3D"mailto:collin.richards@ni.com" target=3D"_blank">collin.richards=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The salt-te=
st package uses files with .a extensions in it&#39;s tests. These<br>
are used in tests that inspect the tree structure of the file system and<br=
>
have nothing to do with static libraries.<br>
<br>
This triggers an OE QAWarning. Skip the staticdev check for this package<br=
>
to disable this warning.<br></blockquote><div><br></div><div>merged.<br><br=
></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Collin Richards &lt;<a href=3D"mailto:collin.richards@ni.com=
">collin.richards@ni.com</a>&gt;<br>
Natinst-ReviewBoard-ID: 145293<br>
---<br>
=C2=A0meta-openstack/recipes-support/salt/<a href=3D"http://salt_2016.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-openstack/recipes-support/salt/<a href=3D"http://salt_201=
6.3.0.bb" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a> b/meta-=
openstack/recipes-support/salt/<a href=3D"http://salt_2016.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
index a99296a..7024f42 100644<br>
--- a/meta-openstack/recipes-support/salt/<a href=3D"http://salt_2016.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
+++ b/meta-openstack/recipes-support/salt/<a href=3D"http://salt_2016.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">salt_2016.3.0.bb</a><br>
@@ -35,6 +35,10 @@ S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
=C2=A0inherit setuptools update-rc.d<br>
<br>
+# Avoid a QA Warning triggered by the test package including a file<br>
+# with a .a extension<br>
+INSANE_SKIP_${PN}-tests +=3D &quot;staticdev&quot;<br>
+<br>
=C2=A0# Note ${PN}-tests must be before ${PN}-common in the PACKAGES variab=
le<br>
=C2=A0# in order for ${PN}-tests to own the correct FILES.<br>
=C2=A0PACKAGES +=3D &quot;\<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a1149dab2332fd90538262b8f--
