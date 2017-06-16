Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF507E00B58; Fri, 16 Jun 2017 05:22:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6572DE00A9B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Jun 2017 05:22:20 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5GCMIdu002869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Jun 2017 05:22:18 -0700 (PDT)
Received: from server.local (128.224.22.223) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Jun 2017 05:22:18 -0700
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	<meta-virtualization@yoctoproject.org>
References: <20170616121047.30717-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8a2678cb-7306-9463-864e-93763a86dea7@windriver.com>
Date: Fri, 16 Jun 2017 08:22:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170616121047.30717-1-adrian.ratiu@ni.com>
Subject: Re: [meta-openstack][PATCH] layer.conf: bump python-requests 2.12 -> 2.13
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
X-List-Received-Date: Fri, 16 Jun 2017 12:22:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-16 8:10 AM, Ioan-Adrian Ratiu wrote:
> Meta-oe upreved to 2.13 (present in Pyro) so bump it here also to
> avoid bitbake messages like:
> 
> "NOTE: preferred version 2.12.0 of python-requests not available"

Unless we've tested it, I'd like to keep it with the warning. We
are (slowly) working towards an update of all the core components.

This version was selected/preferred, because it actually works.

And the warning will force us to test and confirm if it is safe to
move on.

Has this been tested ?

Or is the warning popping up in another scenario ? i.e. you are
using some packages from meta-openstack that trigger the warning,
but don't hit the runtime issue ? In that case, I could take the
patch, since we do want the package reuse from the layer and
forcing people to live with that warning will restrict the reuse.

Bruce

> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>   meta-openstack/conf/layer.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index 98282e2..61e9fb5 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -18,7 +18,7 @@ PREFERRED_VERSION_python-futures = "3.0.3%"
>   PREFERRED_VERSION_python-django = "1.8.6"
>   PREFERRED_VERSION_python-netaddr = "0.7.19"
>   PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
> -PREFERRED_VERSION_python-requests = "2.12.0"
> +PREFERRED_VERSION_python-requests = "2.13.0"
>   PREFERRED_VERSION_python-amqp = "1.4.9"
>   PREFERRED_VERSION_python-kombu = "3.0.%"
>   
> 


