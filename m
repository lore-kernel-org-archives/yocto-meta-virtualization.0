Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E980BE00CE1; Tue,  8 Sep 2015 07:13:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.175 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CEDAE00AF0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:13:01 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so120090849ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bJ+l+L5Cygcc/bh6BEFwfogeScTCHmqtFkZ6xFcNlXA=;
	b=JVjFlgWiGVq3oMW3ULNgHsyM6wEU5gbicK1iCSUBht09nLkmDt54vkFEc3X94fmoUf
	/2qrjBvggAMR7ZJQzZF2j0e8Nd5Vit3XAOCeeNbcQpIuQa36ee+1crvFLDeOwXd26qn6
	/HnqPyAnA7ynXvqjJXn18AeqfHrYga8zw/ZvVrudgVr+EBJQ4wo7s/IxLeVwVhtNpy4i
	kDRU7e2MfqPy14Gy57lNuzy5VbKbYV1xEGmCfh/3i9Rpy2oomcSFFhLhlNLckZKSW17e
	3bGYsBWoFD8EpeAgNbl0jyMpVD5toqts1lJQFVvZTbx9t2YLuXpwkdBKuGjspnu9yQEa
	VMLg==
MIME-Version: 1.0
X-Received: by 10.129.73.203 with SMTP id w194mr10211470ywa.16.1441721579698; 
	Tue, 08 Sep 2015 07:12:59 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:12:59 -0700 (PDT)
In-Reply-To: <1441379737-16799-2-git-send-email-josep.puigdemont@enea.com>
References: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
	<1441379737-16799-2-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 8 Sep 2015 10:12:59 -0400
Message-ID: <CADkTA4MK-VfJrr3xZKcfdB_fj6b0gtsWnFXBV3PS3ztTfYpkTQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][kilo][PATCH 2/2] python-sqlalchemy: add dependency on sqlparse
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
X-List-Received-Date: Tue, 08 Sep 2015 14:13:02 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Sep 4, 2015 at 11:15 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Account for python-sqlparse dependency.
> Project home page has moved to github.
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
> index c64855b..3c20a50 100644
> --- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Database schema migration for SQLAlchemy"
> -HOMEPAGE = "http://code.google.com/p/sqlalchemy-migrate/"
> +HOMEPAGE = "https://github.com/stackforge/sqlalchemy-migrate"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204e9800998ecf8427e"
> @@ -24,4 +24,5 @@ RDEPENDS_${PN} += "python-sqlalchemy  \
>         python-decorator \
>         python-tempita  \
>          python-pbr \
> +       python-sqlparse \
>      "
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

