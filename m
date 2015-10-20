Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D54EE00A73; Tue, 20 Oct 2015 07:43:11 -0700 (PDT)
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
	*      [209.85.160.182 listed in list.dnswl.org]
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62E58E00A70
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Oct 2015 07:42:41 -0700 (PDT)
Received: by ykba4 with SMTP id a4so12461475ykb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Oct 2015 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=c7p2LGd8+j5FuLP9fnjtPTosxRTJwYjpKu22HFRgvh0=;
	b=fRMI7gW/arOxoDJyHkPdMvht8hnV60nKrx0NNH3x3HQkskbAso+RxEjtDp4p+Q0Ohb
	9ExM0FI7TjPrtfVbiMijm/ile8neX5RtxE9RjU9NiAwOhzeEJrO2bV+c9NP7vvzbA7/y
	2DJzEjK4+tNpAu2RyiC4HE0Q0g4Wf7tZNpoHQ/65C80csvQIAMNObdYs9Hl5hMyvTzWm
	Kt6enwrBm3Qa/G2k/3TnGzWsVrD/gOz6mXww94tY75oM75BcnpRVmj6ycqv0oKd3OthA
	lH8f5MfVPHy0SkbE3+Nrd+S1zlbLPRdOQq4atc/JKejKBfDX8npacwVAZcimeyGvw/gu
	FZpQ==
MIME-Version: 1.0
X-Received: by 10.129.0.2 with SMTP id 2mr2827924ywa.127.1445352161389; Tue,
	20 Oct 2015 07:42:41 -0700 (PDT)
Received: by 10.129.153.142 with HTTP; Tue, 20 Oct 2015 07:42:41 -0700 (PDT)
In-Reply-To: <1445255604-65032-1-git-send-email-josep.puigdemont@enea.com>
References: <1445255604-65032-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 20 Oct 2015 10:42:41 -0400
Message-ID: <CADkTA4PwKQdVZk4=ps25scwwk2xbyxY1bo=VJT9GBPFCA+2-Jw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo]][PATCH] python-openstackclient: fix checksums
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
X-List-Received-Date: Tue, 20 Oct 2015 14:43:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2015 at 7:53 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  .../recipes-devtools/python/python-openstackclient_1.0.4.bb           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
> index a585b68..221c817 100644
> --- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
> @@ -8,8 +8,8 @@ SRCNAME = "python-openstackclient"
>
>  SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "595c9be3ae2f967f7dd5f33753137377"
> -SRC_URI[sha256sum] = "d39a2e6cf98d409f8545b9d3a207eb8cbf3b2fc5ea17b0f8d9bed52326ca9f49"
> +SRC_URI[md5sum] = "3ba35cbfa48b876d198d83e37a794721"
> +SRC_URI[sha256sum] = "4ae6d7b35fd1da2a07959fea9639e506871abfb769c62f3692d2f2585605ac85"

Where they just wrong for the version before ? Or did something change
upstream ? If
they re-packed the tgz, we'd like to document that and check what
actually changed.

Bruce

>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
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

