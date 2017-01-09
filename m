Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 555B0E00443; Mon,  9 Jan 2017 09:24:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF89EE003E4
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Jan 2017 09:24:51 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v09HOpS3017350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Jan 2017 09:24:51 -0800
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 9 Jan 2017 09:24:50 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1483974277-17378-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e31d73a8-8dcd-e680-6f6e-e275ad7f0a3c@windriver.com>
Date: Mon, 9 Jan 2017 12:24:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483974277-17378-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [mcs][PATCH] python-horizon: cleanup QA warnings
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
X-List-Received-Date: Mon, 09 Jan 2017 17:24:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-09 10:04 AM, Mark Asselstine wrote:
> Currently we are seeing warnings like:
>
>     .../horizon.scss is owned by gid 1001, which is the same as the
>     user running bitbake.
>
> These are caused by using 'cp -a' in this case, by excluding the
> 'ownership' part of -a we can avoid these QA issues.
>

merged.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-horizon_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
> index 5a23930..d2cb345 100644
> --- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
> @@ -124,7 +124,7 @@ do_install_append() {
>
>      # the following are setup required for horizon-apache
>      install -d ${DASHBOARD_SHARE_DIR}
> -    cp -a ${S}/openstack_dashboard  ${DASHBOARD_SHARE_DIR}
> +    cp -a --no-preserve=ownership ${S}/openstack_dashboard  ${DASHBOARD_SHARE_DIR}
>      cp ${S}/manage.py  ${DASHBOARD_SHARE_DIR}
>
>      install -D -m 644 ${WORKDIR}/local_settings.py \
>


