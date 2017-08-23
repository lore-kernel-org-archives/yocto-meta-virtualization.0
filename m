Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B3D4E00D5D; Tue, 22 Aug 2017 19:48:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.176 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC95CE00BB1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:48:35 -0700 (PDT)
Received: by mail-ua0-f176.google.com with SMTP id g11so1624836uah.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W8r+myP90BYd4kfMInEm4Bqf1mmPHs8swJ/1EWqrGBM=;
	b=eTNPOUVX0eKIYrqRAeeVeXQXqpRqdkMWogrqZDgvXaSvcGektVGKJLtTxyKl6vHjOU
	SEArNDAVrY5YXR1G2L+PN/Fia7lmdYHQ4JAXUKZoLil6+c61fO6BrjVxtw6UdH7KZbwT
	9ZZ6v6AbhggsvEkf2YDoxuEw37/b2hYbT6xURoO5taVcuIU69A8KpsX65XRl/ftCxfF+
	64/W7ONTMvg4cmIAHPyIP5XAVSJOR2wGwBIZFUPMNpQ9fSFBajvrn9BqEkm4Fcpml77o
	BVMw0mt1QcAGfdRmOxZ8K7CDf1LzvC0/6YlrAD4zlUcmlrWhYRRmRmjz7ub9swMKktpP
	l48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W8r+myP90BYd4kfMInEm4Bqf1mmPHs8swJ/1EWqrGBM=;
	b=WGGuwuFjEJRMGKWZadmZESr0AA2zGY5F/tE9C6hx+HTWKaIAWWidFEGML9xvnQ+u9b
	BKCCy1Zhl1usb/A4D5OaEAxPvxgWALHJEcd+FX/rViQp8DYlkrVhtsHYQrqs9ERuRqh4
	XW79NBx6Y1j7IpF8MeZ2+KKqIy9OzyxAa5AS0bRhoEOsFtzUyDU00NmvDIyWyIkskrwA
	Gr2MiBXN5g62TzYFx1bKP+6DMOEC89N9KhvUkbEjQ6mx6B1SVnvmmmmNDS1sznUCMcoY
	H2SV/FWM3KO3IMNjJFAz62K7WQXuTwu2lyXo81mtxta2O/nRfTOgRcqUyGRc2bJ+4Sqx
	ZBZA==
X-Gm-Message-State: AHYfb5iwsSoad7CU+4rOX2PHQoykpxbEKBeY8i7p6rNzySLnKyLlLpcI
	ONKlV0zHJmNTeJG1V83lR+DaGs39OA==
X-Received: by 10.176.75.213 with SMTP id b21mr883278uag.3.1503456514787; Tue,
	22 Aug 2017 19:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 22 Aug 2017 19:48:34 -0700 (PDT)
In-Reply-To: <1503421241-20958-1-git-send-email-mark.asselstine@windriver.com>
References: <1503421241-20958-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2017 22:48:34 -0400
Message-ID: <CADkTA4ModXGF+QirZG1kzzzK0niwyV5+4Ltx_XTgesRqO+aaUA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] cyrus-sasl: drop bbappend
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
X-List-Received-Date: Wed, 23 Aug 2017 02:48:36 -0000
Content-Type: multipart/alternative; boundary="f403045e22a67fd04f055762bf78"

--f403045e22a67fd04f055762bf78
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Aug 22, 2017 at 1:00 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The change implemented in the bbappend is now part of the main recipe
> file. See commit a97ab8e018d86461a4701625dc16b09370fad21f [cyrus-sasl:
> inherit autotools-brokensep] in meta-openembedded.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend | 1
> -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_
> 2.1.26.bbappend
>
> diff --git a/meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend
> b/meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend
> deleted file mode 100644
> index 7447c56..0000000
> --- a/meta-openstack/recipes-support/cyrus-sasl/cyrus-sasl_2.1.26.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -inherit autotools-brokensep
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

--f403045e22a67fd04f055762bf78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 22, 2017 at 1:00 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The change implemented in the bb=
append is now part of the main recipe<br>
file. See commit a97ab8e018d86461a4701625dc16b0<wbr>9370fad21f [cyrus-sasl:=
<br>
inherit autotools-brokensep] in meta-openembedded.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>support/cyrus-sasl/cyrus-sasl_<wbr>2.1.26=
.bbappend | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-<wbr>support/cyrus-sasl/cyr=
us-sasl_<wbr>2.1.26.bbappend<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>support/cyrus-sasl/cyrus-sasl_<wbr=
>2.1.26.bbappend b/meta-openstack/recipes-<wbr>support/cyrus-sasl/cyrus-sas=
l_<wbr>2.1.26.bbappend<br>
deleted file mode 100644<br>
index 7447c56..0000000<br>
--- a/meta-openstack/recipes-<wbr>support/cyrus-sasl/cyrus-sasl_<wbr>2.1.26=
.bbappend<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-inherit autotools-brokensep<br>
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
</div>

--f403045e22a67fd04f055762bf78--
