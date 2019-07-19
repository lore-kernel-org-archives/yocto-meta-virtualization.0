Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37B2BE00C09; Fri, 19 Jul 2019 12:17:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A73BE00A93
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jul 2019 12:17:08 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id u10so22440296lfm.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jul 2019 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LqzVUSv8QPqmP0r5n39M5zSqEIQS9lMF0TAtTU+1D5U=;
	b=c+gW5KhfTgBG5bfDirO7WIAG/pOuZ8LXMO5hO+NLYdsLhZU9F3nLUYGaWlH62yE82B
	pkQSLYS8GRPD0V3QrYBe26PxU/yqrv4A/8Ozgd2pC7bzJeHajGWcksL7IuEbyb+gD3+X
	flBEkDZDUOsVWCDlSecbhLdBK0FH1KJTmVA+NA208bXf4Ibszt+41HaKlJ05NeXgyIUM
	65eySoiCw1khCHi5YKoBjBnY37A4yE6Q7aaw7OnHC3vPoHWBMLP7FwUw+kFdrnmPDXFP
	OL0oOE54jafnOAFev9Shsmq3gV++qx1VYwMMdAwK3I4To40sTD2a9uQTDe1cmoP6v1qa
	1kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LqzVUSv8QPqmP0r5n39M5zSqEIQS9lMF0TAtTU+1D5U=;
	b=aZi1WVcTRC3K0ahBZisbjLaPUtHfjV0G9ogILbMvS+nezFyPnH81DlcvyzzC8mTY/f
	MHBnhdFq94JnfTcmBQekhmTzvU0+BXX3kXrdO+DXskIKLysxozrrcS1TmMmbxAXb5Xmi
	HCuv0eGtwgzKaSPvhWUgmkT48nuew4sVhvjKc/ArGnWus/LW0AYzZaT8Grz7GbMPMZNM
	EV/SHyU4wCa60YyEK2Zhe2vUWSDx8kJ7sK4vJXozo/9VE+w/zH94j7IaeqZkuC7d2tEC
	yInSwusw3ZpxyPeiT5GDNM2R0QLdzQSxrtZcN+fv6z9nIs8O72urbRT9PHcCnaxhkHDn
	mDCQ==
X-Gm-Message-State: APjAAAXPSLfi2paVWY0d/00EWiwHpZOkvaJQGIuqrk+4k07vMPItSl2y
	pGrVop//lTDD8A58bdSYNmGNffSzwjRryw578zY=
X-Google-Smtp-Source: APXvYqwLLtKuaCcJ3rOxjlKLjftYwnu61zIO82bwDMKrcmM6777XJmtk1HQApg9yNU7zN4CVGnJJbcQFbrVrTRuzI2o=
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr25402483lfo.63.1563563827444; 
	Fri, 19 Jul 2019 12:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <1563349114-19162-1-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1563349114-19162-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Jul 2019 15:16:56 -0400
Message-ID: <CADkTA4PPwTtJYUk0avh1LZRqYbEFfkoirLOcAWQtwjRFBo3aTA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] openssh: update bbappend
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
X-List-Received-Date: Fri, 19 Jul 2019 19:17:09 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Jul 17, 2019 at 3:39 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> Update the bbappend since openssh had been upgraded to 8.x in oe-core.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-openstack/recipes-connectivity/openssh/files/mcs-sshd                | 0
>  .../openssh/{openssh_7.%.bbappend => openssh_%.bbappend}                  | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 meta-openstack/recipes-connectivity/openssh/files/mcs-sshd
>  rename meta-openstack/recipes-connectivity/openssh/{openssh_7.%.bbappend => openssh_%.bbappend} (100%)
>
> diff --git a/meta-openstack/recipes-connectivity/openssh/files/mcs-sshd b/meta-openstack/recipes-connectivity/openssh/files/mcs-sshd
> old mode 100755
> new mode 100644
> diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
> rename to meta-openstack/recipes-connectivity/openssh/openssh_%.bbappend
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

