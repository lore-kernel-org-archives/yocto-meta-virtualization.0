Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD223E00AB9; Mon, 10 Sep 2018 17:34:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C2DFE00A85
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Sep 2018 17:34:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8B0YEOs005559
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2018 17:34:14 -0700 (PDT)
Received: from server.local (128.224.20.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 10 Sep 2018 17:34:13 -0700
To: Stefan Agner <stefan@agner.ch>, <meta-virtualization@yoctoproject.org>
References: <a9421b92abcdbc3c76f9bd6783cc0c5a@agner.ch>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8d25ae3a-6f8a-7b45-33e0-1564dce82eb2@windriver.com>
Date: Mon, 10 Sep 2018 20:34:12 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a9421b92abcdbc3c76f9bd6783cc0c5a@agner.ch>
Cc: Brandon Shibley <brandon.shibley@toradex.com>
Subject: Re: OpenEmbedded Image Format
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
X-List-Received-Date: Tue, 11 Sep 2018 00:34:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-09-10 7:21 PM, Stefan Agner wrote:
> Hi,
> 
> Is there a OpenEmbedded image type which allows to build images which
> are OCI Image Format compliant? meta-virtualization includes the
> oci-image-tools, hence the recipe for tooling is there. There is
> currently no -native support for oci-image-tool and its dependencies,
> but I guess that shouldn't be too far away. Any thoughts?

This is something that we typically do with umoci, not with the
raw tools.

re-inventing what better tools already do in a bbclass using
the raw oci-image-tools is an not an exercise worth doing.

Not to mention, nearly every use case I currently have for
working with container images, involves registries, and adding
something as clunky as a build system to generate the images
just doesn't make sense.

How were you planning on running/using the OCI bundles ?

I've been doing similar things for quite some time in meta-cube
i.e. http://layers.openembedded.org/layerindex/recipe/87474/

But that all happens outside of the build system.

I could move more of the tools over to meta-virt, if there's
interest.

Cheers,

Bruce

> 
> --
> Stefan
> 


