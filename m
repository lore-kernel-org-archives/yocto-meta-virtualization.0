Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F5D1E0083D; Fri,  6 Jan 2017 19:12:26 -0800 (PST)
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
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04928E007EB
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jan 2017 19:12:22 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id u25so64439308qki.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jan 2017 19:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rU6TNCHS00PUprvrhfIeEHF7FqVQr1QD8F68ORCwoNk=;
	b=Z5HjNNuXAU9FyWcnRDedDbzSyKiAkuDL8xvIli9WMgWG5quDigdHHx5ThYDvugoY3B
	ldYeYv0CK95Hct0vCeiNSdF1IdL/n7mMrDK15DuRz3IYcHdQaT8JgNp9XJWxi3qGjeNd
	XSzRhQrNR7S7TLhJi+Bt0zdENJzRd8IBUmJbkoS5rOPQnR3piZpmgdeKZ4wBtvJ1zmv3
	0/GErdw4KVNjI4TcVGk5WFgNYpfMRczIGghOxZunSAv98+rL7S7VCHVCktMLER49eWcu
	/bqPLeRCfaMooFTNTRTQ/BSg6VHnp8b5WefWp7uk6UoRn12a2lIaJfSzml/iBFfOxVJ9
	A8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rU6TNCHS00PUprvrhfIeEHF7FqVQr1QD8F68ORCwoNk=;
	b=stHRHfXH48VHT4nYg27IU/trfI70UxJdy4dYqCze17GZ8UoixxEe9QHSlUu8Cqt5Yl
	tIffogFxazB5pIoK39sr1FlpNIs/9Bw1XsHnuij0uA/dJ8jRtf/xdN2oBL3UYIeAiBdy
	yrZfKAxyg+MBuXvdGcNR3OClJxSkZj7AGkNbdlnzEFNpECgwsXpuKOi2LvzuJORxyrRj
	CNODuttED3ry5hXhAf4UDoe4IPSrdfKV3ubwvsu+V/mYCjsrVUDxIL3z0nnH7NXot5iN
	tday49RtEtP01RYUiR4V8i2UurQwFWUx6tpRqsNLu+s6JnLsQ9EQPSMJBOTOBlUpz/65
	4N3g==
X-Gm-Message-State: AIkVDXK86BRiJ72xqGEkSFvlEcfbUWY7nhdna2AZQvIPc5fI/TIhtX1hPi7ry1wpnu53y4ygsqLtP4T4v8TIOA==
X-Received: by 10.55.169.216 with SMTP id s207mr14942171qke.211.1483758741690; 
	Fri, 06 Jan 2017 19:12:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 6 Jan 2017 19:12:21 -0800 (PST)
In-Reply-To: <20170105170523.1318-1-cardoe@cardoe.com>
References: <20170105170523.1318-1-cardoe@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jan 2017 22:12:21 -0500
Message-ID: <CADkTA4MkzPcJic_n4UsKLc9yk9zQfM7PX8uqvH+40mjmtaGZgA@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/3] more Xen updates
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
X-List-Received-Date: Sat, 07 Jan 2017 03:12:26 -0000
Content-Type: multipart/alternative; boundary=94eb2c0544d2bb1dcd0545788021

--94eb2c0544d2bb1dcd0545788021
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 5, 2017 at 12:05 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> Here are some updates for master and morty. The README is something that I
> hope
> is ok to try and provide users some more info when they work with Xen.
>

merged.

I think I got the right README patch. As much as I like gmail, I detest the
way it threads messages with the same subject.

Bruce


>
> Doug Goldstein (3):
>   xen: update license checksum
>   xen: remove unused patch
>   xen: add a README to provide info for users
>
>  recipes-extended/xen/README                        | 23 +++++++++
>  ...l-compilation-warning-fix-for-arm-aarch64.patch | 58
> ----------------------
>  recipes-extended/xen/xen.inc                       |  2 +-
>  3 files changed, 24 insertions(+), 59 deletions(-)
>  create mode 100644 recipes-extended/xen/README
>  delete mode 100644 recipes-extended/xen/files/
> libxl-compilation-warning-fix-for-arm-aarch64.patch
>
> --
> 2.10.2
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

--94eb2c0544d2bb1dcd0545788021
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jan 5, 2017 at 12:05 PM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Here are some updates =
for master and morty. The README is something that I hope<br>
is ok to try and provide users some more info when they work with Xen.<br><=
/blockquote><div><br></div><div>merged.</div><div><br></div><div>I think I =
got the right README patch. As much as I like gmail, I detest the way it th=
reads messages with the same subject.</div><div><br></div><div>Bruce</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<br>
Doug Goldstein (3):<br>
=C2=A0 xen: update license checksum<br>
=C2=A0 xen: remove unused patch<br>
=C2=A0 xen: add a README to provide info for users<br>
<br>
=C2=A0recipes-extended/xen/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++++<br>
=C2=A0...l-compilation-warning-fix-<wbr>for-arm-aarch64.patch | 58 --------=
--------------<br>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A03 files changed, 24 insertions(+), 59 deletions(-)<br>
=C2=A0create mode 100644 recipes-extended/xen/README<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/<wbr>libxl-compilation-=
warning-fix-<wbr>for-arm-aarch64.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.10.2<br>
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
</div></div>

--94eb2c0544d2bb1dcd0545788021--
