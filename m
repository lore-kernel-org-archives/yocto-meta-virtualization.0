Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FA63E00DAB; Thu, 10 Sep 2015 11:46:28 -0700 (PDT)
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
	*      [209.85.160.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66305E00BB9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:23 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so68182280ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GmiqqrsSqU1VClB3SvO54LbIBlrruUSxGIC+0peVMAg=;
	b=hafSTEmW4ei/kFjGcZVqEIi6jmPzE9MA98dBipFpT7C0MKXu+jWmK3xdnTIhzKyMvU
	rdAQkTO4w33DAnzs7IHfCx2hq98vTLh3kpkK/bnpjqUzH9G8kknMNZDQQwgeM+19/9dY
	7pSjsbz+2xbRwI2V6vanCDnZ5qniQs3fsvp6KEfzIi0FT6+GM97IbJtj/EUzwCF4BGzH
	uXJHZweDhxk2LmU7Px9tM14NI6B8SHKnRs9mpm1xQbG64E/6jqyMlZNEuNld20zuGvrU
	pZrMKSXYG5lURDSRm7qFBZ3t+g+ako1DXOVpFpGHjBzTrBSEZIjxZiWnJ3coDMYD0yQz
	q9cg==
MIME-Version: 1.0
X-Received: by 10.170.159.214 with SMTP id a205mr48073062ykd.62.1441910783481; 
	Thu, 10 Sep 2015 11:46:23 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 10 Sep 2015 11:46:23 -0700 (PDT)
In-Reply-To: <1441806093-6926-1-git-send-email-josep.puigdemont@enea.com>
References: <1441806093-6926-1-git-send-email-josep.puigdemont@enea.com>
Date: Thu, 10 Sep 2015 14:46:23 -0400
Message-ID: <CADkTA4MrBjRCmcZNNtTfikoHbaGxLxws1RR16n7bzusOf9gKdQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [juno/dizzy-juno][PATCH] python-django-appconf: use correct hashes
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
X-List-Received-Date: Thu, 10 Sep 2015 18:46:28 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 9, 2015 at 9:41 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb b/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb
> index f406708..4ed2392 100644
> --- a/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-django-appconf_0.6.bb
> @@ -10,8 +10,8 @@ SRCNAME = "django-appconf"
>  SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
>  "
>
> -SRC_URI[md5sum] = "40494042c3c8bd1e054c884e5ed4bb6c"
> -SRC_URI[sha256sum] = "a88ed8fb923a53c70c2c46fbe4508b5f81646b4b01401f1568a821671b33215c"
> +SRC_URI[md5sum] = "6971f6c9df6b5213797578fecc1845d7"
> +SRC_URI[sha256sum] = "06b64baf26c7a436cbb81464e7a50047aea30db1059dbe6e09dc443efa23ba20"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.1.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

