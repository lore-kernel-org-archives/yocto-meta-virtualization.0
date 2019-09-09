Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A458E00D33; Mon,  9 Sep 2019 10:37:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5821E00E00
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:36:55 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id c12so11182442lfh.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xSmOWQXbqU0Ootf9vn+WIuu8uWPffMJfFHH3b590bzs=;
	b=nM8i7WA8DHfhJlfOkpeEfVEQ0YZV3eK6nRZiuEGovyT694gIdljpNXiqBQwqJNfINd
	PN7lvrATAsXSYvHEu9ZenRLbT0l94ZQ+/SEh9vrKAb6c5IXsau+BDQs/JOwhz1VLOGy7
	NoiWD0OyFSIMpWnCh5krWlFKTVs0X5XL/rqkEe7ZuSBVsKjvjVmJEGVOXxsWcVbrUGiT
	cKHzz3kIyg2ocAMpka+UVQ/tMMEBBbIi5Y6l6TcsyTl7N/2M99Y7X4v4h85jYZtz8T0K
	c2FxOj5GUgIUr693XTak02mSU1KDmHB1cGQeXfMLnfmO6R5/yQjsd/tzMfY4NJiUKNTf
	sk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xSmOWQXbqU0Ootf9vn+WIuu8uWPffMJfFHH3b590bzs=;
	b=kp1zqM8Lp8qvPlAE+N7Dywx2/0CKTFpdF5bZx77mLy08ikCf1H0YYqFw7P/Gw30aIb
	SU8WaFKHadZKMYSG/yYHqqLNNZz8JWX72CNNwL/YMBkGzuJBb5ONNoGbz4G9o3ULqUlB
	aMcKl6RoqGkPiEH8OJmhQa3E/f2ChL7q16cZWg2MliO4vuNFm0MeeLX2Wy2fXyCnu0yZ
	6L9BWcOFo3q91ofqs86AcCF81xcii2T9NW36c5Dciic7W7TiTmvFkWCa8b09z7HMRReM
	+f+Tlra9hb99VCEv+eHZB5w3/M+fYPGRRWVJfOp6eRuXwmA62GeaBRHkOnb6jgbpgJ4A
	3Z2g==
X-Gm-Message-State: APjAAAVw2MXXWFDj85JI7IgZTrnmNvshyGUkRULyzgrLm/TXjGCOBYMG
	fZX97S5nrumBBuZNMRFmGShSR8K/Uss1SmNauWCsL3Sk
X-Google-Smtp-Source: APXvYqxFoyAzzWSK6+XqsUIoOsBWkK55UUi9HUfxV8U1uCfXbUldJF8xsieJOG1AoFvWCI61d6LQ5y1NEm6IV8LFfcs=
X-Received: by 2002:ac2:4117:: with SMTP id b23mr17703727lfi.36.1568050614703; 
	Mon, 09 Sep 2019 10:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <1568022130-15624-1-git-send-email-zhe.he@windriver.com>
	<1568022130-15624-2-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1568022130-15624-2-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:36:43 -0400
Message-ID: <CADkTA4PMAVvMJCfTV6tdf7GheyeUB5p6Dfs_5frH6pwe8nc8NA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH 2/2] consul: Not automatically start system service on boot
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
X-List-Received-Date: Mon, 09 Sep 2019 17:37:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 9, 2019 at 5:42 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> The systemd service needs to be tuned according to various use cases and cannot
> be able to always start successfully for example when there is no network
> interface named br0 by default.
>
> Thus the default configuration is mainly used as an example. Let's not
> automatically start it on boot.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index f3e64e9..566fbc9 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -25,7 +25,7 @@ inherit systemd go
>  COMPATIBLE_HOST_mipsarch = "null"
>
>  SYSTEMD_SERVICE_${PN} = "consul.service"
> -SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>
>  do_install_append() {
>      install -d ${D}/${systemd_unitdir}/system
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

