Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D3A1E00747
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 17:52:34 -0700 (PDT)
Received: by mail-la0-f47.google.com with SMTP id eo20so894469lab.20
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 17:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+4h6a8k3aSoMDT8bVmwZsS3Veh8BNWMQkekzXAQLhiU=;
	b=ENsHJnrpYoVz4Zty9cqHvQLFpVQaWTuUNSPvSooC3pt/4w5MBYOmKOzCdNskhduVum
	XPNTnpJhORBKjqWX/iYFMRBlbH9VBAOoZmmUF7ZbQhdQf3OZTfmabAfujHDz0HgmVluS
	2y0gQbInu2MtzBTlRGgJMj4Jo+FCvlnJw6I0kEwXWTih07c60DOMmNL+PiC+tGIoKJyZ
	J7FgLX3KcqLB8EgtKSV8mWVOCQrk3qw2oS8Q78ncxISavkp4W8FKw7jtiioL5ySeP60Z
	BK71irgAqjdAQFGweaPbu+jZYFFU4ALy1eFYGic/jujpjt5tJ3eOw7v1PNwmKAOsk8nz
	hraA==
MIME-Version: 1.0
X-Received: by 10.152.44.225 with SMTP id h1mr8293803lam.15.1377132753042;
	Wed, 21 Aug 2013 17:52:33 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 21 Aug 2013 17:52:33 -0700 (PDT)
In-Reply-To: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
References: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
Date: Wed, 21 Aug 2013 20:52:33 -0400
Message-ID: <CADkTA4OQXOgvj4XhA2LhENVYpOdEsRodaPj+5kRA=EVf9zRKmw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zi Shen Lim <zishen.lim@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Victor Kamensky <victor.kamensky@linaro.org>
Subject: Re: error triggered by meta-virtualization
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
X-List-Received-Date: Thu, 22 Aug 2013 00:52:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 7:22 PM, Zi Shen Lim <zishen.lim@linaro.org> wrote:
> Hi,
>
> After adding meta-virtualization layer into bblayers.conf, I'm not
> able to build packages.
> Looks like the search path is broken [1].
>
> As a quick workaround, I removed
> meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend.
> That resolved the issue.

I'm definitely still able to build packages and plenty of python packages with
that bbappend in place.

That being said, we've talked about it before, and it should be we can remove
as it isn't necessary anymore.

I take it you have your own python patches, which the clobbered THISDIR
is breaking.

If you make the following change, does it build for you ?

------------------

diff --git a/recipes-devtools/python/python_2.7.3.bbappend
b/recipes-devtools/python/python_2.7.3.bbappend
index e39deba..55301c7 100644
--- a/recipes-devtools/python/python_2.7.3.bbappend
+++ b/recipes-devtools/python/python_2.7.3.bbappend
@@ -1,5 +1,4 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

 DEPENDS += " ncurses"

------------

If you can confirm it works, I'll push the change ASAP.

Bruce

>
> Suggestions?
>
> Thanks,
> z
>
> [1] http://pastebin.com/BmK4QnnE
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

