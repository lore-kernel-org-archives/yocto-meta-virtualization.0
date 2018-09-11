Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDBDCE00AB3; Mon, 10 Sep 2018 18:11:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1E79E00A85
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Sep 2018 18:11:32 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8B1ADji004268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2018 18:10:38 -0700
Received: from server.local (128.224.20.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 10 Sep 2018 18:10:18 -0700
To: Stefan Agner <stefan@agner.ch>
References: <a9421b92abcdbc3c76f9bd6783cc0c5a@agner.ch>
	<8d25ae3a-6f8a-7b45-33e0-1564dce82eb2@windriver.com>
	<203ab06d2498d62ef1bedbb43c49d144@agner.ch>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e7157948-3b1a-3d76-9f1a-d3c69ba3dd17@windriver.com>
Date: Mon, 10 Sep 2018 21:10:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <203ab06d2498d62ef1bedbb43c49d144@agner.ch>
Cc: Brandon Shibley <brandon.shibley@toradex.com>,
	meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Tue, 11 Sep 2018 01:11:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-09-10 9:01 PM, Stefan Agner wrote:
> On 10.09.2018 17:34, Bruce Ashfield wrote:
>> On 2018-09-10 7:21 PM, Stefan Agner wrote:
>>> Hi,
>>>
>>> Is there a OpenEmbedded image type which allows to build images which
>>> are OCI Image Format compliant? meta-virtualization includes the
>>> oci-image-tools, hence the recipe for tooling is there. There is
>>> currently no -native support for oci-image-tool and its dependencies,
>>> but I guess that shouldn't be too far away. Any thoughts?
>>
>> This is something that we typically do with umoci, not with the
>> raw tools.
>>
>> re-inventing what better tools already do in a bbclass using
>> the raw oci-image-tools is an not an exercise worth doing.
>>
>> Not to mention, nearly every use case I currently have for
>> working with container images, involves registries, and adding
>> something as clunky as a build system to generate the images
>> just doesn't make sense.
>>
>> How were you planning on running/using the OCI bundles ?
> 
> I am not very familiar with OCI and its tools yet, so quite possible I
> am on the wrong track here.
> 
> What we are looking for is a way to build an image using OE, generate a
> container from it and push it to a registry. The last operation is
> probably a separate/manual step, but ideally OE should build the tools
> for it.

Right, this is a function of meta-virtualization. You could use the
raw tools, but as I mentioned ... you would be unwise to try and
duplicate everything that much more complex tools already do.

> 
> A second use case is where we build the container runtime image, but
> also the container image using OE. In this case the container image
> should get installed at OE build time onto the container runtime rootfs.

That's something you need to do in your own layers/image definitions.
There's nothing really special needed for this, just image definitions
and dependencies.

I've done similar things in the past, and almost always walked away from
it (virtualization based images with already installed VM images). Since
the inflexibility of needing to build and re-assemble the image
outweighs the benefits you think you are getting.

It is almost always easier to do it as a post build step. In particular
with all the filesystem back ends, union layers, 3rd party elements,
etc, etc that come into play.

I find that a lot of folks want the build system to do more automation
and steps in this area, when it doesn't make a lot of sense.

But again, it is something you can do in your own layers, everything
to do it is available.

> 
> Since OpenEmbedded is the tooling to build the container runtime image
> as well as the container itself, all those steps preferably should be
> handled in OE as well.

I disagree on that point (to a degree). Assembling final images outside
of the build system from the artifacts is almost always faster and
more flexible. But I digress, this isn't the important part of what you
are looking for.

> 
> It seems to me that umoci is the tool we are looking for. Is this
> available as -native?

It very likely is what you need. A host tool + a very thin bbclass in
your layer to generate the oci bundle.

It could be extended to be a host tool. I just haven't had the use case
for it yet (I use it on target).

Cheers,

Bruce

> 
> --
> Stefan
> 
>>
>> I've been doing similar things for quite some time in meta-cube
>> i.e. http://layers.openembedded.org/layerindex/recipe/87474/
>>
>> But that all happens outside of the build system.
>>
>> I could move more of the tools over to meta-virt, if there's
>> interest.
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> --
>>> Stefan
>>>


