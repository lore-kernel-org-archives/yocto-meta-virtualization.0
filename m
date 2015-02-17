Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0729DE0077E; Mon, 16 Feb 2015 20:55:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.171 listed in list.dnswl.org]
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29621E00777
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:55:02 -0800 (PST)
Received: by lbiz12 with SMTP id z12so2322618lbi.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UgWEnMDmg1T3vLpbuShRyT16FHLkfzjDJa7ZJfH+jhQ=;
	b=U7fx6NC6PMdLI6xFCxid8/Xd6KpnYATHtDVbY5JyCFi4qkQpF9Uze0xy7p2krILe/N
	CDgTiaO6Po8/cxCVLACypCNNBZSTqv48FOBWtJlwBa4EoUBmMQg13BRSCITbyITDT/TJ
	ge6ABACIqCMVjRmY8uF0IHKQOcIWDclmEfn9CfU4+ZMw+3hee6YDDMrNO/qLXp0rVEuX
	x6Olx7AwM0pRp9f0xV5LNjfYKdsjwI02rMha9bpJbyMYdlyO9TUIeGd/1MlvWFPWj7ZW
	bto90wi/k1ermNBsGUHzgTgxctXwkcz6bdn4Vjdm1GYh+/f9CvRiQz6eKMA7GxJ5Qbco
	0qZw==
MIME-Version: 1.0
X-Received: by 10.112.126.162 with SMTP id mz2mr26438984lbb.51.1424148902076; 
	Mon, 16 Feb 2015 20:55:02 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Mon, 16 Feb 2015 20:55:02 -0800 (PST)
In-Reply-To: <1423864730-7582-1-git-send-email-tudor.florea@enea.com>
References: <1423864730-7582-1-git-send-email-tudor.florea@enea.com>
Date: Mon, 16 Feb 2015 23:55:02 -0500
Message-ID: <CADkTA4O-NuW2qwd-VgSz8o4CKrPKQPDx07PRus_WNw+qyiqqKg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] tgt: Do not install the conflicting config files
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
X-List-Received-Date: Tue, 17 Feb 2015 04:55:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 13, 2015 at 4:58 PM, Tudor Florea <tudor.florea@enea.com> wrote:
> Do not install the (empty) config files as it will
> conflict with the real config file installed by python-cinder package.
>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  meta-openstack/recipes-support/tgt/tgt_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index 8be9fe4..b79cccc 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -22,7 +22,9 @@ do_compile() {
>  }
>
>  do_install() {
> -    oe_runmake -e DESTDIR="${D}" install-programs install-conf install-scripts
> +    #skip oe_runmake install-conf. The (empty) targets.conf file will confilct with

Typo: "conflict".

> +    #the real file provided by python-cinder
> +    oe_runmake -e DESTDIR="${D}" install-programs install-scripts

.. but I'm not convinced of this change. When you say "conflict", are
you getting a
packaging error that I'm not seeing in my builds, or something else ?

Sure both packages may be trying to write the same file, but I'm also aware of
scenarios where you might not want Cinder's file to take precedence. So in that
case, we should consider patching and renaming the files, versus simply not
installing them.

Bruce

>
>      if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
>          install -d ${D}${sysconfdir}/init.d
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

