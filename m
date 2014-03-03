Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0D42E009E1
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Mar 2014 08:36:13 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s23GaCHK004343
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Mar 2014 08:36:12 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 08:36:12 -0800
Message-ID: <5314AF79.2000301@windriver.com>
Date: Mon, 3 Mar 2014 11:36:09 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1393622236-23064-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1393622236-23064-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH] rabbitmq-server: add missing zip-native DEPENDS
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
X-List-Received-Date: Mon, 03 Mar 2014 16:36:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-28 04:17 PM, Mark Asselstine wrote:
> As part of the build there is an attempt to package rabbit_common-0.0.0.ez
> using zip. If zip isn't present on the build host this will cause an error:

I've staged this locally, once I've smoked tested it with a series of other
updates, I'll push it to the repo.

Bruce

>
> | cp ../rabbitmq-server/include/*.hrl dist/rabbit_common-0.0.0/include/
> | (cd dist; zip -q -r rabbit_common-0.0.0.ez rabbit_common-0.0.0)
> | /bin/sh: 1: zip: not found
>
> Adding zip-native in the DEPENDS avoids making the assumption that zip
> is installed on the build host.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.0.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.0.4.bb b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.0.4.bb
> index 6a50444..b5796a1 100644
> --- a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.0.4.bb
> +++ b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.0.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.rabbitmq.com/"
>   LICENSE = "MPL-1.1"
>   LIC_FILES_CHKSUM = "file://LICENSE-MPL-RabbitMQ;md5=10a81373a21abb63f98ef5dc93e1601a"
>   SECTION = "network"
> -DEPENDS = "erlang-native libxslt python-simplejson"
> +DEPENDS = "erlang-native libxslt python-simplejson zip-native"
>   PR = "r0"
>
>   SRC_URI = "http://www.rabbitmq.com/releases/rabbitmq-server/v${PV}/${PN}-${PV}.tar.gz \
>


