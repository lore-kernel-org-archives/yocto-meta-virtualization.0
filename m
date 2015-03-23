Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3329DE0094C; Sun, 22 Mar 2015 19:51:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62220E00853
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Mar 2015 19:51:20 -0700 (PDT)
Received: by labon10 with SMTP id on10so23377393lab.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Mar 2015 19:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Sn2T06tNNb5JZH+3kvYYnxFQJVuM3JLvegFfURm/hok=;
	b=HT3zpPpdpFmy2cUAgP5bgww/cjhev4putv7cof3OGB828jBITTpDXGBNbEEfM1F5rL
	2EwcH5ILl48SgZg1OCU9JsXj71s2YMVrWxAekut6LjhT8nVZVgrN1i3xvJKASkwP+LR0
	6Vq1q2ajmHd140GnJT95VUlQRj+V+kNur7oxkbUYR1RjAEpa8ffe71jDxIzpkcI9yyrL
	0mCFbpXWSRHgemL/OY506phm3hjkL+mmHYZ4+TSQrx1a9tr46GjbscfvR227YnCuAdPx
	o1u3TtvRrYHUZHDl/9CQf4YGMgDNesP95yxE+06BSihL0ANdP+3kPE+V/Z+4IgxXIgpE
	GNIw==
MIME-Version: 1.0
X-Received: by 10.112.239.1 with SMTP id vo1mr82127357lbc.110.1427079078728;
	Sun, 22 Mar 2015 19:51:18 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Sun, 22 Mar 2015 19:51:18 -0700 (PDT)
In-Reply-To: <1426867164-18526-1-git-send-email-tudor.florea@enea.com>
References: <1426867164-18526-1-git-send-email-tudor.florea@enea.com>
Date: Sun, 22 Mar 2015 22:51:18 -0400
Message-ID: <CADkTA4N=1XZX1YKbLLWY-rJ3yRDQGPKZR0gYPLg2GC7f4f6rLA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] python-cmd2: update checksum
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
X-List-Received-Date: Mon, 23 Mar 2015 02:51:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 20, 2015 at 11:59 AM, Tudor Florea <tudor.florea@enea.com> wrote:
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>

To follow the conventions of oe-core, we want/need to log a reason for
a checksum
change, when the associated version hasn't changed.

What happened ? Did the upstream re-pack the repo ? Something else ?

Bruce


> ---
>  meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> index 9558cc6..4d5d29d 100644
> --- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> @@ -9,8 +9,8 @@ SRCNAME = "cmd2"
>
>  SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
> -SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
> +SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
> +SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
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

