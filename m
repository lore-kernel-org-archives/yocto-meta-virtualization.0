Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C14BEE01061; Thu,  8 Mar 2018 18:23:38 -0800 (PST)
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
	*      [209.85.220.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CD60E0106F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 18:23:35 -0800 (PST)
Received: by mail-qk0-f181.google.com with SMTP id f25so2115800qkm.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 18:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uVKLWt59e2BnqSa53c+2jsVIcfcshVlFm17q8vPeYh8=;
	b=gAbFLBxVvmOiisbTRgNQne6CLGVF7Pr1KaOKzjLJJnvpnxJBzuh479/3lNWTbeXAFU
	1VpV6xaVD0Z8V6SWRS2saXwaxqja6oLZKc/254U2UOakID3BmHQhQSHF+mnS/YkpI7y2
	PQDSc3Z8H/jLbAxJlG7b8u2BxhAbO6GrJhDKqzCfjjQqt6pW+8EQJugv5kEAZbzLo15m
	qofJFKASFuATpowkvzGDA89vqJg4WBwy8Jso9Q7acGoP898OfyYq+4EZ6mE0i80tuQKJ
	/SBtKgjrXbXkauDrJ6V9SQXJhV+qDEsNwwEwH9nuxOTP9RujAySHG8Ymy72iRY1B7472
	b9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uVKLWt59e2BnqSa53c+2jsVIcfcshVlFm17q8vPeYh8=;
	b=ctNZWM+oiOtbwsUZCmuip/YgmR5f5jfEIL9QXVdjjvr1Y2Jfa12jOg/isFNqeLz3sT
	Un3fuDHVMX6d+yWR3i17C9+4FwTZWdSADv9M6hUiXKFf/iMSvDxR7fdwbHhSAlIFIau9
	nKtAb4BXcSdeYupFL9JaLMhOyn/uOo/uqRWScI0GLcwwf2x0UOXEcUWoCOidvyZfTBHS
	4Y9oRxaktHNhtP0EaEiwbZPU1q5CZtXa8xRLc5dPMIePfL4aZch6jrwXIw53VJxw1iWc
	3+54TkTL4hWnd8h9jyF78/4hyq7QwpjHKWRQ8KzQOpj0xPpt7HrvMXZ/H9Qsrryu6OlS
	Bqaw==
X-Gm-Message-State: AElRT7EehNW3YZIhPCX5+Vd8XSrT/Hr4Hd+2vLnO+/ipGrbEFlURBzxx
	kiMqZUIk6a8FnDBWdvBkziDKFGZNYUVVLft2BnI=
X-Google-Smtp-Source: AG47ELuXXKxxgVo/pDDNqVVNsymV7VXSL4jampJTXjZPTAuGmF3cb0AYkxdg+SiUPrNsV156eQHA3nuXFKyNIrX/lfo=
X-Received: by 10.55.182.68 with SMTP id g65mr26184042qkf.41.1520562214780;
	Thu, 08 Mar 2018 18:23:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.178 with HTTP; Thu, 8 Mar 2018 18:23:34 -0800 (PST)
In-Reply-To: <d59c1a4b1f58515ff9d4db9470019c630da4df5e.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<d59c1a4b1f58515ff9d4db9470019c630da4df5e.1519915283.git.kurt.bodiker@braintrust-us.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 8 Mar 2018 18:23:34 -0800
Message-ID: <CACMJ4GYkqBL+zBnqfNOg+iy=7dqJF3EaMf743Wrwd44pQ2hhqA@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/7] xen: Define the standard values needed for stubdoms
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
X-List-Received-Date: Fri, 09 Mar 2018 02:23:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c060d1eabc88d0566f17aa4"

--94eb2c060d1eabc88d0566f17aa4
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 7:35 AM, Kurt Bodiker <kurt.bodiker@braintrust-us.com
> wrote:

> From: kebodiker <kurt.bodiker@braintrust-us.com>
>
> This commit introduces the stubdom.inc file that is required for each
> recipe that is/will be built for Xen stubdomains.
>



> +# Couldn't find any other way to access the version of Xen used as a
> dependency.
> +# This version number needs changed to match version of Xen recipe  used
> in builds.
> +XEN_VERSION = "4.9.0"
>


:( I understand the challenge here and sadly I don't have a better
recommendation, but: would putting a scope on the DEPEND enable the build
to fail fast in case
of a mismatch?  ie:

    DEPENDS = "xen (= ${XEN_VERSION}-r0)"

I don't much like the "-r0" tail on that though -- anyone have any better
suggestion?



> +# Not sure if we need to (or even can) support 32-bit stubdoms
> +# If we we do not need to support the 32-bit environment, then this
> section and the
> +# export statement afterwards can be removed.
>

OpenXT uses 32-bit stubdomains - though they are not based on mini-os.
32-bit PV domains have different isolation properties to 64-bit domains,
due to the way the
pagetables are managed and as seen by their differing Meltdown exposure, so
please do leave the code to support 32-bit stubdoms in there as they are
valued.

I have a slight preference for dropping (or revising) the comment.


> +STUBDOM_CPPFLAGS += "-isystem ${WORKDIR}/mini-os/include"
> +STUBDOM_CPPFLAGS += "-D__MINIOS__ -DHAVE_LIBC"
> +STUBDOM_CPPFLAGS += "-isystem ${WORKDIR}/mini-os/include/posix"
> +STUBDOM_CPPFLAGS += "-isystem ${RECIPE_SYSROOT}/usr/include/
> xenstore-compat"
> +STUBDOM_CPPFLAGS += "-isystem ${WORKDIR}/mini-os/include/x86 -isystem
> ${WORKDIR}/mini-os/include/x86/${XEN_TARGET_ARCH}"
> +STUBDOM_CPPFLAGS += "-U __linux__ -U __FreeBSD__ -U __sun__"
> +STUBDOM_CPPFLAGS += "-nostdinc"
> +CPPFLAGS_INCLUDE_DIR = "-isystem ${RECIPE_SYSROOT}/cross-root-$
> {XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include"
> +STUBDOM_CPPFLAGS += "${CPPFLAGS_INCLUDE_DIR}"
> +STUBDOM_CPPFLAGS += "-isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/lwip/include
> -isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/lwip/
> include/ipv4"
> +STUBDOM_CPPFLAGS += "-isystem ${RECIPE_SYSROOT}/usr/include/xen"
>

The define for CPPFLAGS_INCLUDE_DIR in the middle of the above would better
moved elsewhere.

Would a multi-line define would be more OE-style than the series of lines
all appending to the same variable?


+
> +STUBDOM_CFLAGS += "-mno-red-zone -O1 -fno-omit-frame-pointer -m64
> -fno-reorder-blocks -fno-asynchronous-unwind-tables -DBUILD_ID
> -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes
> -Wdeclaration-after-statement -Wno-unused-but-set-variable
> -Wno-unused-local-typedefs -fno-stack-protector -fno-exceptions"
>

The above would also be slightly nicer split over multiple (shorter) lines.

thanks

Christopher

--94eb2c060d1eabc88d0566f17aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Mar 5, 2018 at 7:35 AM, Kurt Bodiker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodiker@b=
raintrust-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: kebodiker &lt;<a href=3D"mailto:kurt.bodiker@braintr=
ust-us.com">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;<br>
<br>
This commit introduces the stubdom.inc file that is required for each<br>
recipe that is/will be built for Xen stubdomains.<br></blockquote><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+#=
 Couldn&#39;t find any other way to access the version of Xen used as a dep=
endency.<br>
+# This version number needs changed to match version of Xen recipe=C2=A0 u=
sed in builds.<br>
+XEN_VERSION =3D &quot;4.9.0&quot;<br></blockquote><div><br></div><div><br>=
</div><div><div>:( I understand the challenge here and sadly I don&#39;t ha=
ve a better recommendation, but: would putting a scope on the DEPEND enable=
 the build to fail fast in case</div><div>of a mismatch?=C2=A0 ie:</div><di=
v><br></div><div>=C2=A0 =C2=A0 DEPENDS =3D &quot;xen (=3D ${XEN_VERSION}-r0=
)&quot;</div><div><br></div><div>I don&#39;t much like the &quot;-r0&quot; =
tail on that though -- anyone have any better suggestion?</div></div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+# Not sure if we need to (or even can) support 32-bit stubdoms<br>
+# If we we do not need to support the 32-bit environment, then this sectio=
n and the<br>
+# export statement afterwards can be removed.<br></blockquote><div><br></d=
iv><div><div>OpenXT uses 32-bit stubdomains - though they are not based on =
mini-os. 32-bit PV domains have different isolation properties to 64-bit do=
mains, due to the way the</div><div>pagetables are managed and as seen by t=
heir differing Meltdown exposure, so please do leave the code to support 32=
-bit stubdoms in there as they are valued.</div><div><br></div><div>I have =
a slight preference for dropping (or revising) the comment.</div></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
+STUBDOM_CPPFLAGS +=3D &quot;-isystem ${WORKDIR}/mini-os/include&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-D__MINIOS__ -DHAVE_LIBC&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-isystem ${WORKDIR}/mini-os/include/<wbr>posix=
&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-isystem ${RECIPE_SYSROOT}/usr/include/<wbr>xe=
nstore-compat&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-isystem ${WORKDIR}/mini-os/include/x86 -isyst=
em ${WORKDIR}/mini-os/include/<wbr>x86/${XEN_TARGET_ARCH}&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-U __linux__ -U __FreeBSD__ -U __sun__&quot;<b=
r>
+STUBDOM_CPPFLAGS +=3D &quot;-nostdinc&quot;<br>
+CPPFLAGS_INCLUDE_DIR =3D &quot;-isystem ${RECIPE_SYSROOT}/cross-root-$<wbr=
>{XEN_TARGET_ARCH}/${GNU_<wbr>TARGET_ARCH}-xen-elf/include&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;${CPPFLAGS_INCLUDE_DIR}&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-isystem ${RECIPE_SYSROOT}/cross-root-$<wbr>{X=
EN_TARGET_ARCH}/lwip/include -isystem ${RECIPE_SYSROOT}/cross-root-$<wbr>{X=
EN_TARGET_ARCH}/lwip/<wbr>include/ipv4&quot;<br>
+STUBDOM_CPPFLAGS +=3D &quot;-isystem ${RECIPE_SYSROOT}/usr/include/<wbr>xe=
n&quot;<br></blockquote><div><br></div><div>The define for CPPFLAGS_INCLUDE=
_DIR in the middle of the above would better moved elsewhere.</div><div><br=
></div><div>Would a multi-line define would be more OE-style than the serie=
s of lines all appending to the same variable?</div><div><br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+STUBDOM_CFLAGS +=3D &quot;-mno-red-zone -O1 -fno-omit-frame-pointer -m64 -=
fno-reorder-blocks -fno-asynchronous-unwind-<wbr>tables -DBUILD_ID -fno-str=
ict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-sta=
tement -Wno-unused-but-set-variable -Wno-unused-local-typedefs -fno-stack-p=
rotector -fno-exceptions&quot;<br></blockquote><div><br></div><div>The abov=
e would also be slightly nicer split over multiple (shorter) lines.</div><d=
iv><br></div><div>thanks</div><div><br></div><div>Christopher</div><div><br=
></div></div></div></div>

--94eb2c060d1eabc88d0566f17aa4--
