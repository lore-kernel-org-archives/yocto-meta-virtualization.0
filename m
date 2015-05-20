Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C718E005B9; Wed, 20 May 2015 05:17:14 -0700 (PDT)
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
	*      [209.85.213.44 listed in list.dnswl.org]
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11D3DE0027F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 May 2015 05:17:12 -0700 (PDT)
Received: by yhom41 with SMTP id m41so12264012yho.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 May 2015 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IiCtC6V2mjP8TTl8S1lhkEO4ZXCnODbfY1tLJ80BpNg=;
	b=pRrmKXobP8jPhQ6Qv6NbImazMJGXPQJsjlDYdbxj2DLNB/zacdGl7FSktUL95J1SMV
	lR5+1kJ8f1DUC5cepOM+0CndX3zAGebscUpyx6q0OufotfTXW/KoU6D3FdKTyVvlInvR
	fdCOHyuz5j+5S/+lddDnyGmbbbbg4/UQpjqLMr0vOz6sAQQ/HlR1G6FwBlsj+buxEf4G
	COaV6vu4wHxIXmXXI0DLPrz7W0r39E3hWebLQxwLlDca6Cz6dVGdlzh53PS1LI0nKSvv
	yoQbCIWGqgGcrhWIghfTiWAFoJcXAnJZj+Fdd1OvCB9kQhMibW/32BL+KbX6TUInQYsb
	lVUA==
MIME-Version: 1.0
X-Received: by 10.170.72.131 with SMTP id o125mr34566146yko.60.1432124232309; 
	Wed, 20 May 2015 05:17:12 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 20 May 2015 05:17:12 -0700 (PDT)
In-Reply-To: <1432018463-21203-1-git-send-email-jackie.huang@windriver.com>
References: <1432018463-21203-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 20 May 2015 08:17:12 -0400
Message-ID: <CADkTA4PBvXzJwEopFtBBa6XrH7poOqL554fyZEhbRHU_jctkKQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] python-keystoneclient: add missing rdepends on python-oslo.serialization
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
X-List-Received-Date: Wed, 20 May 2015 12:17:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 19, 2015 at 2:54 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Add missing rdepends or it fails with:
>   File "/usr/lib64/python2.7/site-packages/keystoneclient/session.py", line 22, in <module>
>     from oslo_serialization import jsonutils
> ImportError: No module named oslo_serialization
>

Thanks Jackie, I've merged the two changes.

Bruce

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> index 0063efc..383163d 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> @@ -32,6 +32,7 @@ RDEPENDS_${PN} += " \
>         python-requests \
>         python-simplejson \
>         python-oslo.config \
> +       python-oslo.serialization \
>         python-pbr \
>         "
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

