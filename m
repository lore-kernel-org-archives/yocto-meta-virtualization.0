Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B361E008D2; Thu, 26 Apr 2018 15:10:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01FBCE007F2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 15:10:14 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id r125-v6so32960748lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QMHgC/osLljdV2gmljxmz3SlZHuFZTIYrIstlFVMzHc=;
	b=qw1gcqCD/N1Qbzm9CPGTWLzk2Ae0+G/wZ2aGwzz8NGv1cziTGfL5C/Wf2//WbEVYfH
	qgE63XBA5zqLWAmN4O4cf7ZyRrdlkHfjnU1wCoRbu42Qv6gj5+WtxBO5iXuwHv1fdTY0
	AOHH1JRDiUYoKBAQMEvh+n8m298SKv7vXARl2j289hljvpr0hQFvELwEMvGFrc4+yVLE
	ZIottykPWdqqWI14Il2DJO2250HzQwQjaIVwD1OS/5RNG1eYs11nASHlN8PKv/KEVyTO
	n6gzs9dtYLoIzHgcF6O1Dff8a8wQ55fBGEAKBEqTdb8TQeoFKJ7ZJt95UQQlDomtUUG5
	qNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QMHgC/osLljdV2gmljxmz3SlZHuFZTIYrIstlFVMzHc=;
	b=CUMnWFdhM/cSNz/Y6bKH6HZWJ4v2QGrh1eXFy7BwUMfBXrpq3D3Os+P3+wgfhpjrwB
	1t1Z1aL0Lg/uxvuSUIH2cUEboSM/HJ/3lmQ5hKzoYc6ZNMSSyjoS8r+5zzziLRSWR8Qo
	kmm+YbQiYnznFnWjLqQE0lOH7Ng6+ephiIWc8BfOMPZnc68Uwb3/eIydccdsa4QKNctu
	YPboImVDST1qowQyh0TpIPKly8xgHOG2MiIWOXWVt+K2awU5DxTV11l4I8HrfFoKAKy5
	EGHTcFD6J9YnwYBFkT58aY+vr1nIkrc1LdQXzKTVFy8aRS9MQrDqsjXP17eh6FVdi2qY
	kEuQ==
X-Gm-Message-State: ALQs6tClDp//xUGmy0gdrFzF3v5NCLPkZRLnMO66ucZgsDpiCoG3TQtJ
	rsSjPpbfOefeLoR6bn0E/Nm5NtYewrn30wERyRM=
X-Google-Smtp-Source: AB8JxZqVD1kCpJFiQkFV5iE9N5LiM+xpTOXHLaAnP7Op8TEobyThUncg8y6l7jsGtSa1E6wI+536e63YbP3YWzXfTV4=
X-Received: by 2002:a19:2ccd:: with SMTP id
	s196-v6mr8206950lfs.18.1524780613741; 
	Thu, 26 Apr 2018 15:10:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.145.78 with HTTP; Thu, 26 Apr 2018 15:10:13 -0700 (PDT)
In-Reply-To: <7d801cebe77874e9083de05626174ccd7db8f694.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
	<7d801cebe77874e9083de05626174ccd7db8f694.1524769930.git.kurt.bodiker@braintrust-us.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 26 Apr 2018 15:10:13 -0700
Message-ID: <CACMJ4GbjW07A7sZPyM4L2hpiF8zBVAvo7AyKKD-POp+_cy8okg@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v3 7/8] xen: TPM Emulator for Xen stubdoms
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
X-List-Received-Date: Thu, 26 Apr 2018 22:10:16 -0000
Content-Type: multipart/alternative; boundary="000000000000d7b191056ac7a693"

--000000000000d7b191056ac7a693
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 26, 2018 at 1:15 PM, Kurt Bodiker <
kurt.bodiker@braintrust-us.com> wrote:

> TPM Emulator is a software-based TPM and MTM emulator. This TPM Emulator
> recipe creates a static library that is cross-compiled against MiniOS,
> Xen, LWIP, Newlib, PolarSSL, and the stubdom-specific GMP headers and
> subsequently used during the cross-compilation and linking of the Xen
> vTPM and vTPM Manager stubdomains.
>
> The current Xen source code is hardcoded to fetch a specific version of
> this package. The patch files originate from the Xen/stubdom source
> tree. This recipe provides the flexibility to change version or modify
> the patches.
>
> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> ---
> Changes in v3:
>  - none
> Changes in v2:
>  - patches formatted to striplevel=1
> ---
>  recipes-extended/xen/files/tpmemu-0.7.4.patch      |  12 ++
>  recipes-extended/xen/files/vtpm-bufsize.patch      |  13 ++
>  recipes-extended/xen/files/vtpm-cmake-Wextra.patch |  21 +++
>  .../xen/files/vtpm-deepquote-anyloc.patch          | 127 +++++++++++++
>  recipes-extended/xen/files/vtpm-deepquote.patch    | 187
> ++++++++++++++++++++
>  .../xen/files/vtpm-implicit-fallthrough.patch      |  10 ++
>  recipes-extended/xen/files/vtpm-locality.patch     |  50 ++++++
>  .../xen/files/vtpm-parent-sign-ek.patch            | 196
> +++++++++++++++++++++
>  recipes-extended/xen/tpm-emulator.inc              |  37 ++++
>  recipes-extended/xen/tpm-emulator_0.7.4.bb         |  26 +++
>  10 files changed, 679 insertions(+)
>  create mode 100644 recipes-extended/xen/files/tpmemu-0.7.4.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-bufsize.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-cmake-Wextra.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-deepquote.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-implicit-fallthrough.
> patch
>  create mode 100644 recipes-extended/xen/files/vtpm-locality.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-parent-sign-ek.patch
>  create mode 100644 recipes-extended/xen/tpm-emulator.inc
>  create mode 100644 recipes-extended/xen/tpm-emulator_0.7.4.bb
>
>
Seeing whitespace damage in vtpm-locality.patch on: tpm/tpm_emulator.h

--000000000000d7b191056ac7a693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 26, 2018 at 1:15 PM, Kurt Bodiker <span dir=3D"ltr">&lt;<a =
href=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodik=
er@braintrust-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">TPM Emulator is a software-based TPM and MTM emulator.=
 This TPM Emulator<br>
recipe creates a static library that is cross-compiled against MiniOS,<br>
Xen, LWIP, Newlib, PolarSSL, and the stubdom-specific GMP headers and<br>
subsequently used during the cross-compilation and linking of the Xen<br>
vTPM and vTPM Manager stubdomains.<br>
<br>
The current Xen source code is hardcoded to fetch a specific version of<br>
this package. The patch files originate from the Xen/stubdom source<br>
tree. This recipe provides the flexibility to change version or modify<br>
the patches.<br>
<br>
Signed-off-by: Kurt Bodiker &lt;<a href=3D"mailto:kurt.bodiker@braintrust-u=
s.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
---<br>
Changes in v3:<br>
=C2=A0- none<br>
Changes in v2:<br>
=C2=A0- patches formatted to striplevel=3D1<br>
---<br>
=C2=A0recipes-extended/xen/files/<wbr>tpmemu-0.7.4.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 12 ++<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-bufsize.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 ++<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-cmake-Wextra.patch |=C2=A0 21 ++=
+<br>
=C2=A0.../xen/files/vtpm-deepquote-<wbr>anyloc.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 127 +++++++++++++<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-deepquote.patch=C2=A0 =C2=A0 | 1=
87 ++++++++++++++++++++<br>
=C2=A0.../xen/files/vtpm-implicit-<wbr>fallthrough.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 10 ++<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-locality.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 50 ++++++<br>
=C2=A0.../xen/files/vtpm-parent-<wbr>sign-ek.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 196 +++++++++++++++++++++<br>
=C2=A0recipes-extended/xen/tpm-<wbr>emulator.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 37 ++++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" rel=3D"=
noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 26 +++<br>
=C2=A010 files changed, 679 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>tpmemu-0.7.4.patch=
<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-bufsize.patch=
<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-cmake-Wextra.=
patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-deepquote-any=
loc.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-deepquote.pat=
ch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-implicit-fall=
through.<wbr>patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-locality.patc=
h<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-parent-sign-e=
k.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/tpm-<wbr>emulator.inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://tpm-emulato=
r_0.7.4.bb" rel=3D"noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb=
</a><br>
<br></blockquote><div><br></div><div>Seeing whitespace damage in vtpm-local=
ity.patch on:=C2=A0tpm/tpm_emulator.h</div></div></div></div>

--000000000000d7b191056ac7a693--
