Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A92EE00A62; Tue, 21 Nov 2017 12:53:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E47BDE006CA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:53:43 -0800 (PST)
Received: by mail-qk0-f171.google.com with SMTP id w125so13956091qkb.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O1Dq2PJTolsxQDlsSQ5jj3pXGDhUH2qHmk7ptfiaolg=;
	b=E2wLkpE3IcxX0V+ax9VsmT6/chVlmBeV69gM46ytq9y7dCtrVt0ihXc3fApiOmfubn
	6sAiN+TOb4tHqjoII67Aqk55eG9G8SIBVMaU7JLPfuzVAYn0qI+cvmmyb1tCnfGx/oiG
	0f/e0QplKMuHEi+3mG47bo/RYMUXhv6O1SRAcjBWxvWGrr11gJTz6K73+B7txvCLbKdt
	1/LlY6kvCkHO+4F4AlNLeo3W7vr+KRom8EG7oL1lRnvvHAC9PDBlfjoLKVcvm5zIAaKf
	e7kjNGo/Md7zhCDMx7GmEUnauqfFB5XcYG1EUK2ycXHut7W4GxYg7aRdhMEiMkgqhas+
	wEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O1Dq2PJTolsxQDlsSQ5jj3pXGDhUH2qHmk7ptfiaolg=;
	b=RbUbLUNEOkPzner3zzHXcSZ8S0tekTz9uLg/1ABSMIzZ1zWcbdGTjJu1G6Mm1D2IqX
	I9Lg02QZA/d3wj4XLZ/A4F+3J+Cy9tzbENmoGw8puysZEknS4yZFvJ8upW6ugt9ThGoV
	HMn5vhHwYvp8gNHwN6abUvZodPRDI5ZKxMgFWGx2O6JB/8LnOIaYeK4FefXeq9zneQKL
	zMizlIU+jm8uN2TyZ6HrVguLAxgePoAfElkrYXli2G+6kMAowsly1fj8vDERJB6kbLV1
	4ziLTLpW57fR+vYYAm3+QaELehUUNAjMRDeInY7fmNXhDt/xOZVCAXWxQKSbTE9i39VT
	2CVQ==
X-Gm-Message-State: AJaThX6qgSPOf0zQIkEAXSO9D4i36LYEj6+t/sne4ufp7kmBm67tcuGK
	GKDE5L/S8fbr2l274Br04v/ZzfAvFxIAiDUrGeY=
X-Google-Smtp-Source: AGs4zMaU2UNEuK23VntWw7n0PMikukMpgI9T02YDz4C+Ix5dwktwLJDHkOswmprkbJ2UHy2a7kwiFrfB3RrofZDNBDg=
X-Received: by 10.55.149.70 with SMTP id x67mr28690826qkd.62.1511297622919;
	Tue, 21 Nov 2017 12:53:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.86.169 with HTTP; Tue, 21 Nov 2017 12:53:42 -0800 (PST)
In-Reply-To: <CADkTA4PjjqEU-wj7qJnEnn2B-WpGpVVTqU1c-wD3A-Z-uxjNzw@mail.gmail.com>
References: <20171116224123.28383-1-alistair.francis@xilinx.com>
	<CADkTA4PjjqEU-wj7qJnEnn2B-WpGpVVTqU1c-wD3A-Z-uxjNzw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 21 Nov 2017 12:53:42 -0800
Message-ID: <CACMJ4Gb+vO47iWNV9qiedWXuDSKjeo0t1NNUuuE+x+5eWSVPuw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Enable compilation with external source
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
X-List-Received-Date: Tue, 21 Nov 2017 20:53:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 12:07 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Thu, Nov 16, 2017 at 5:41 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>>
>> When building Xen from an external source the compile step fails as
>> there is no Makefile (or anything else) copied into the Yocto
>> build directories.
>
> I can't say that I have an opinion on this, since I'm not up to speed on all
> the moving parts.
>
> I haven't seen any replies from the Xen folks, so replying in the hopes that
> they'll see this and notice the thread.

Hello - thanks for the nudge.

> One question though. When you say 'external source' are you talking about
> the oe-core "externalsrc" concept, or some Xen specific thing ?

I've never used the externalsrc class, so this review is a bit tricky.

Alistair: There's a comment at the top of the externalsrc.bbclass file
that indicates that a second variable (EXTERNALSRC_BUILD_pn-myrecipe)
could be used to set the build directory to be the same as the source
directory -- does using that give the behaviour that you're looking
for, without needing this cp added to do_compile?

Christopher


>
> Bruce
>
>>
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>> This seems really nasty, but it's the only way I can get external
>> source build working.
>>
>>  recipes-extended/xen/xen.inc | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index cb314f8..7a54416 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -901,7 +901,6 @@ EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
>>  EXTRA_OEMAKE += "debug=n"
>>
>>  do_configure() {
>> -
>>      #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done
>> manually
>>      if [ "${XSM_ENABLED}" = "1" ]; then
>>          echo "XSM_ENABLE := y" > ${S}/.config
>> @@ -920,6 +919,9 @@ do_configure() {
>>  }
>>
>>  do_compile() {
>> +    # If using external source we need to copy the code in
>> +    cp -rf ${S}/* ${B}/
>> +
>>      # workaround for build bug when CFLAGS is exported
>>      # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
>>      unset CFLAGS
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

