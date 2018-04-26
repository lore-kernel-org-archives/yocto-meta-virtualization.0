Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 611E0E00831; Thu, 26 Apr 2018 15:08:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.44 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71919E007F2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 15:08:48 -0700 (PDT)
Received: by mail-lf0-f44.google.com with SMTP id r125-v6so32956423lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 15:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VAAlNsiwUfyNeyCtkBirIrIo21DLX3N9gzp/qfQkpT0=;
	b=nTLUhONh3eRBGKcS8jiciGuLVFAawmPuEr4bFtv15BkntkQt9nkZExHeIFojOCHs7N
	Y+nURthHRDAROuhb6uffWGSqhFtXZTt6h7LmJTY1/UrL2OX2g4WyqYh5nZmUhaELDfiP
	+zb9Z6rG5lODE7d/hrOuSIsIj4xzM07mmDCAsV1rjZ5g7DEWvH8bGRZfjeXI6hp5i8+x
	kWYqLBU0hrRVFWRaSNGONlSC+s7KtVxDP4bS6dl7dPVr+NaPNLjdD0l85AZyYjfBOpbJ
	lRHSWIq/mab8kUgTVt3c4Nes/3f8bBHWS5Vk+fG8S/8QeEQExGqhKcjRMviQKBhnT8BO
	D2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VAAlNsiwUfyNeyCtkBirIrIo21DLX3N9gzp/qfQkpT0=;
	b=DgfTbtMPKiaz4W/Zop/aroMx3tEoMVnHTypyMKQbX0LYiI+eJFRqtRUfbyuZOr5uXv
	jHnW+hTjZahZVZd7uhrku4HVywHXCNhcK06rwiwBnZJePRup9jb+X/wW8a+DVo5gGltx
	ZUMAqgsqmEZl1GbkUqiepYP23U+1KsN1sOoZ9qNHnVydz0tcGmRcnvliSseV+QUkFCzD
	VAR++KkXfIO8pWmguIHfReMOG9g94oimQq8p0wUO0xvmP2REjNkXn75iFQ11aIBbK2ES
	7xjW8kjAOLL+HjL7g3j/IoERxYuWTDMVths+Hc1jk3jgQ7clD4YXzcuiC98O0cRDyDfY
	lQbQ==
X-Gm-Message-State: ALQs6tBu0k4rpa+YcMc2IRG1szWws4VxRiJ+kBJ95h001CaJHa+n2g20
	W7IARr8WMFuSnihbiAc4r7rwuHrZpcuJYi25kWM=
X-Google-Smtp-Source: AB8JxZqZFK2QzRmcHqXxWY5ZzS9fTiE0aXvOJDfgteLMtLglUyBmgg8kzQVqFuMo48AHHRq8/0qQ1M69NIrMlJJi3xw=
X-Received: by 2002:a19:5a1d:: with SMTP id
	o29-v6mr17524501lfb.93.1524780527249; 
	Thu, 26 Apr 2018 15:08:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.145.78 with HTTP; Thu, 26 Apr 2018 15:08:46 -0700 (PDT)
In-Reply-To: <6da6ddfac34fbf4fda5683ee2739c0308652a678.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
	<6da6ddfac34fbf4fda5683ee2739c0308652a678.1524769930.git.kurt.bodiker@braintrust-us.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 26 Apr 2018 15:08:46 -0700
Message-ID: <CACMJ4GbZ9-EOjW2gZiWaNiP8DM8hVc0kDQftoRbE3=Xcj5TWiA@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v3 4/8] xen: Newlib recipe and patches for Xen stubdoms
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
X-List-Received-Date: Thu, 26 Apr 2018 22:08:49 -0000
Content-Type: multipart/alternative; boundary="000000000000afecc6056ac7a1e5"

--000000000000afecc6056ac7a1e5
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 26, 2018 at 1:15 PM, Kurt Bodiker <
kurt.bodiker@braintrust-us.com> wrote:

> Newlib provides a fast, C library optimized for embedded systems. In the
> case of Xen stubdomains, we are using MiniOS. This Newlib recipe creates
> static libraries that are cross-compiled against MiniOS, Xen, and LWIP
> headers and subsequently used during the cross-compilation and linking
> of PolarSSL, the stubdom specific GMP, TPM Emulator, and the Xen vTPM
> and vTPM Manager stubdomains. The current Xen source code is hardcoded
> to fetch a specific version of this package. The patch files originate
> from the Xen/stubdom source tree. This recipe provides the flexibility
> to change version or modify the patches.
>
> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> ---
> Changes in v3:
>  - change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
> Changes in v2:
>  - Multi-line variables formatted to match OE style guide
>  - SRC_URI formatted to use SRCREV rather than git tag
>  - patches formatted to striplevel=1
> ---
>  recipes-extended/xen/files/newlib-chk.patch        | 155 +++++
>  .../newlib-stdint-size_max-fix-from-1.17.0.patch   |  16 +
>  recipes-extended/xen/files/newlib.patch            | 727
> +++++++++++++++++++++
>  recipes-extended/xen/newlib.inc                    |  64 ++
>  recipes-extended/xen/newlib_1.16.0.bb              |  21 +
>  5 files changed, 983 insertions(+)
>  create mode 100644 recipes-extended/xen/files/newlib-chk.patch
>  create mode 100644 recipes-extended/xen/files/newlib-stdint-size_max-fix-
> from-1.17.0.patch
>  create mode 100644 recipes-extended/xen/files/newlib.patch
>  create mode 100644 recipes-extended/xen/newlib.inc
>  create mode 100644 recipes-extended/xen/newlib_1.16.0.bb
>
>
Seeing whitespace damage in newlib.patch on:

newlib/libc/machine/i386/i386mach.h
newlib/libm/machine/i386/i386mach.h

--000000000000afecc6056ac7a1e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 26, 2018 at 1:15 PM, Kurt Bodiker <span dir=3D"ltr">&lt;<a =
href=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodik=
er@braintrust-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Newlib provides a fast, C library optimized for embedd=
ed systems. In the<br>
case of Xen stubdomains, we are using MiniOS. This Newlib recipe creates<br=
>
static libraries that are cross-compiled against MiniOS, Xen, and LWIP<br>
headers and subsequently used during the cross-compilation and linking<br>
of PolarSSL, the stubdom specific GMP, TPM Emulator, and the Xen vTPM<br>
and vTPM Manager stubdomains. The current Xen source code is hardcoded<br>
to fetch a specific version of this package. The patch files originate<br>
from the Xen/stubdom source tree. This recipe provides the flexibility<br>
to change version or modify the patches.<br>
<br>
Signed-off-by: Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodiker@braintrust-u=
s.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
---<br>
Changes in v3:<br>
=C2=A0- change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARC=
H}<br>
Changes in v2:<br>
=C2=A0- Multi-line variables formatted to match OE style guide<br>
=C2=A0- SRC_URI formatted to use SRCREV rather than git tag<br>
=C2=A0- patches formatted to striplevel=3D1<br>
---<br>
=C2=A0recipes-extended/xen/files/<wbr>newlib-chk.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 155 +++++<br>
=C2=A0.../newlib-stdint-size_max-<wbr>fix-from-1.17.0.patch=C2=A0 =C2=A0|=
=C2=A0 16 +<br>
=C2=A0recipes-extended/xen/files/<wbr>newlib.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 727 +++++++++++++++++++++<br>
=C2=A0recipes-extended/xen/newlib.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 64 ++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://newlib_1.16.0.bb" rel=3D"noref=
errer" target=3D"_blank">newlib_1.<wbr>16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 +<br>
=C2=A05 files changed, 983 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>newlib-chk.patch<b=
r>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>newlib-stdint-size=
_max-fix-<wbr>from-1.17.0.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>newlib.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/newlib.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://newlib_1.16=
.0.bb" rel=3D"noreferrer" target=3D"_blank">newlib_1.<wbr>16.0.bb</a><br>
<br>
</blockquote><div><br></div><div>Seeing whitespace damage in newlib.patch o=
n:<br><br></div><div><div>newlib/libc/machine/i386/i386mach.h</div></div><d=
iv>newlib/libm/machine/i386/i386mach.h<br></div><div><br></div></div></div>=
</div>

--000000000000afecc6056ac7a1e5--
