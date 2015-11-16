Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B23D8E007F6; Mon, 16 Nov 2015 12:12:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFEECE0071C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Nov 2015 12:12:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAGKCn1g019055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Nov 2015 12:12:49 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 Nov 2015 12:12:48 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <564A38A0.30409@windriver.com>
Date: Mon, 16 Nov 2015 15:12:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [meta-cloud-services][PATCH 1/6] nova: add needed python modules
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
X-List-Received-Date: Mon, 16 Nov 2015 20:12:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-11 09:50 PM, Mark Asselstine wrote:
> Launching nova-compute we get errors regarding missing modules for
> 'netifaces' and 'retrying'. Add the missing modules to nova's
> RDEPENDS.

merged all 6 patches to master.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-devtools/python/python-nova_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
> index 13553f1..0bc5d03 100644
> --- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
> @@ -323,6 +323,8 @@ RDEPENDS_${PN} = " libvirt \
>   		   python-rfc3986 \
>   		   python-oslo.i18n \
>   		   python-sqlparse \
> +		   python-netifaces \
> +		   python-retrying \
>       "
>
>   RDEPENDS_${SRCNAME}-common = "${PN} openssl openssl-misc libxml2 libxslt \
>


