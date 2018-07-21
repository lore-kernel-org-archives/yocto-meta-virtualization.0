Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05D87E00DE3; Fri, 20 Jul 2018 17:25:20 -0700 (PDT)
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
	*      [209.85.208.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22B10E0080A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jul 2018 17:25:18 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id q127-v6so12419314ljq.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jul 2018 17:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tT/Uxw6HW6v+AgE6/NRYY9xs6t1IZAINDyI4gErbwuU=;
	b=H8u1gomhzrdJ6KjD7fnhaCfWZkU81QdJZTYXXvldQuL5jKN5UEiIwqN7u+36mFI2vR
	hCM3CyoRs0CimsIrUDsLUZJSxGN1jOESOwbnsZRwsTaoYlXzzZOuaTw+bIyOKTvDkA/x
	X5QTfvaiKXAYEH0MoPlwG/CRWvLkLnYhLlJqfv9YqV26t5qp11tKb+bPcUepuNq4Cvvw
	4FBt8Cg9zrvun9SZ+yGb04Ym7X4OJXTt0vvIRpArFu5MJR6V+ED29vnMyrcj4t1swhxL
	01776MZ5tyiRkjt0TJk+tJyxFfHK1ULlnP4A5muFsugCvJVCwibGXiQRJFXfypPMtrGG
	2qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tT/Uxw6HW6v+AgE6/NRYY9xs6t1IZAINDyI4gErbwuU=;
	b=BLF1svU8Re/rUNhUuMp0UQFCN0QKTQvNw1zWVCBSGmwp64AUiRRDNXBUYH7SO5cmXW
	6s1wsR3tp6VWy1O34XRZ4Fue+3ssbMlFyUcfsC6VecqcGuxBkVanfvGV9yTshTCx3RAS
	BDy9MbGkb6kQ1XQ2w2AcLlixzGBOt0SohqehzI+75bfCdFiLVtmvqVq57K941HNyxAG+
	5zYZ87NPBCpIeAFgU/VaDpJJdLUhKklNOPfJWoAmVv0anAhTuczG1305V4U+ZMXcHj0k
	7MxWOI662eYu7tJFw1lXj+Lf4FJvLhszqlZmQAd2kN7L9Wztf3aECtYlRr44R6Y3NUWe
	rQnw==
X-Gm-Message-State: AOUpUlFzB2pnou5swb37YmRNN+LXwnxw18OpsZEUq9eOu2KJSqDd7iTz
	0gNtYCOeDpco51RCWA/+2fqclR9AdadbdVTlwaKDRnvQ
X-Google-Smtp-Source: AAOMgpeLTNlTz9ToHXI9VGngcvAkZBOW71QpmUSipen0Fr2VoTBqQoGEDHfbpoXtXZOUlvOoj7q4+7lCJ4kOqZ24YVg=
X-Received: by 2002:a2e:2d2:: with SMTP id
	y79-v6mr2814623lje.100.1532132717812; 
	Fri, 20 Jul 2018 17:25:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:1955:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 17:25:17
	-0700 (PDT)
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 20 Jul 2018 17:25:17 -0700
Message-ID: <CACMJ4GbRicDU5iMyLyYN8QrzbYTvZq-+R4uDAMsDREzxU3VcmA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 0/7] Xen: upgrade to 4.11.0
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
X-List-Received-Date: Sat, 21 Jul 2018 00:25:20 -0000
Content-Type: multipart/alternative; boundary="00000000000064debf057177728f"

--00000000000064debf057177728f
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 18, 2018 at 3:03 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> This patch series:
> * Fixes Xen recipe compatibility with gcc 8.1
> * Adds the Xen recipe for Xen's current version: 4.11.0
> * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
>     - provided to ease backport to older branches (eg. sumo)
> * Removes the 4.10.1 and 4.9.1 recipes
>     - superceded by version 4.11.0
> * Upgrades the vtpm stubdomains to Xen version 4.11.0
> * Applies a bug fix patch to the tpm emulator
> * Fixes whitespace patch fuzz on a vtpm patch
>
> Christopher Clark (7):
>   xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility
>   xen: add recipe for 4.11.0
>   tpm-emulator: apply patch to fix memcmp defect found by gcc
>   xen-vtpm,mini-os : upgrade to Xen 4.11.0
>   xen-vtpm : fix patch fuzz, whitespace-only change
>   xen: remove 4.9.1 recipe and patches
>   xen: remove 4.10.1 recipe and patches
>
>
Please hold off on merging this series for now as I'm intending to send a
slightly updated version of it (should be next week).

Christopher

--00000000000064debf057177728f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 18, 2018 at 3:03 PM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christ=
opher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christophe=
r.w.clark@gmail.com</a><wbr>&gt;<br>
<br>
This patch series:<br>
* Fixes Xen recipe compatibility with gcc 8.1<br>
* Adds the Xen recipe for Xen&#39;s current version: 4.11.0<br>
* Upgrades the existing Xen recipe from 4.10.0 to 4.10.1<br>
=C2=A0 =C2=A0 - provided to ease backport to older branches (eg. sumo)<br>
* Removes the 4.10.1 and 4.9.1 recipes<br>
=C2=A0 =C2=A0 - superceded by version 4.11.0<br>
* Upgrades the vtpm stubdomains to Xen version 4.11.0<br>
* Applies a bug fix patch to the tpm emulator<br>
* Fixes whitespace patch fuzz on a vtpm patch<br>
<br>
Christopher Clark (7):<br>
=C2=A0 xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility<=
br>
=C2=A0 xen: add recipe for 4.11.0<br>
=C2=A0 tpm-emulator: apply patch to fix memcmp defect found by gcc<br>
=C2=A0 xen-vtpm,mini-os : upgrade to Xen 4.11.0<br>
=C2=A0 xen-vtpm : fix patch fuzz, whitespace-only change<br>
=C2=A0 xen: remove 4.9.1 recipe and patches<br>
=C2=A0 xen: remove 4.10.1 recipe and patches<br>
<br></blockquote><div><br></div><div>Please hold off on merging this series=
 for now as I&#39;m intending to send a slightly updated version of it (sho=
uld be next week).</div><div><br></div><div>Christopher</div><div>=C2=A0</d=
iv></div></div></div>

--00000000000064debf057177728f--
