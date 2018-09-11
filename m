Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B4F3E0093B; Tue, 11 Sep 2018 10:01:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E7ABE0053F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 10:01:29 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D1AAA5C17E3;
	Tue, 11 Sep 2018 19:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1536685287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=salNd4Lc+yH1t5KMwf8HhCgH/KgM2oLDJUYbWl3jhFI=;
	b=HoG+QR8RTwf3B6nBpUxaP3GvWUbPklz6YoLeYmFqQCuwAFLq6/i7hsbOum4guiyOJrMVi7
	GO2zLhjD3GtojcopPxWVuPYXjC0cfz3QexmptBkYKF5gPMyY1E8b9AaRQME1t4QRFokJwS
	En1EB1zpHzJHpzuHPXZDRJwrucVeX1M=
MIME-Version: 1.0
Date: Tue, 11 Sep 2018 10:01:27 -0700
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <861eeded-4404-939a-b8fa-150640d12cbc@windriver.com>
References: <a9421b92abcdbc3c76f9bd6783cc0c5a@agner.ch>
	<8d25ae3a-6f8a-7b45-33e0-1564dce82eb2@windriver.com>
	<203ab06d2498d62ef1bedbb43c49d144@agner.ch>
	<e7157948-3b1a-3d76-9f1a-d3c69ba3dd17@windriver.com>
	<bf84980bf3dfbba8462041373596e58f@agner.ch>
	<861eeded-4404-939a-b8fa-150640d12cbc@windriver.com>
Message-ID: <8b419833a091b25a8c21865e06edd0c5@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
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
X-List-Received-Date: Tue, 11 Sep 2018 17:01:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 11.09.2018 04:14, Bruce Ashfield wrote:
> On 2018-09-11 12:37 AM, Stefan Agner wrote:
>> On 10.09.2018 18:10, Bruce Ashfield wrote:
>>> On 2018-09-10 9:01 PM, Stefan Agner wrote:
>>>> On 10.09.2018 17:34, Bruce Ashfield wrote:
>>>>> On 2018-09-10 7:21 PM, Stefan Agner wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Is there a OpenEmbedded image type which allows to build images which
>>>>>> are OCI Image Format compliant? meta-virtualization includes the
>>>>>> oci-image-tools, hence the recipe for tooling is there. There is
>>>>>> currently no -native support for oci-image-tool and its dependencies,
>>>>>> but I guess that shouldn't be too far away. Any thoughts?
>>>>>
>>>>> This is something that we typically do with umoci, not with the
>>>>> raw tools.
>>>>>
>>>>> re-inventing what better tools already do in a bbclass using
>>>>> the raw oci-image-tools is an not an exercise worth doing.
>>>>>
>>>>> Not to mention, nearly every use case I currently have for
>>>>> working with container images, involves registries, and adding
>>>>> something as clunky as a build system to generate the images
>>>>> just doesn't make sense.
>>>>>
>>>>> How were you planning on running/using the OCI bundles ?
>>>>
>>>> I am not very familiar with OCI and its tools yet, so quite possible I
>>>> am on the wrong track here.
>>>>
>>>> What we are looking for is a way to build an image using OE, generate a
>>>> container from it and push it to a registry. The last operation is
>>>> probably a separate/manual step, but ideally OE should build the tools
>>>> for it.
>>>
>>> Right, this is a function of meta-virtualization. You could use the
>>> raw tools, but as I mentioned ... you would be unwise to try and
>>> duplicate everything that much more complex tools already do.
>>>
>>
>> Just to clarify, I meant to do all those steps on the build host. Hence
>> those tools would be required as -native.
>>
>>>>
>>>> A second use case is where we build the container runtime image, but
>>>> also the container image using OE. In this case the container image
>>>> should get installed at OE build time onto the container runtime rootfs.
>>>
>>> That's something you need to do in your own layers/image definitions.
>>> There's nothing really special needed for this, just image definitions
>>> and dependencies.
>>>
>>> I've done similar things in the past, and almost always walked away from
>>> it (virtualization based images with already installed VM images). Since
>>> the inflexibility of needing to build and re-assemble the image
>>> outweighs the benefits you think you are getting.
>>
>> I am worried that preinstalling the container might be inflexibel too.
>>
>> We were thinking to preinstall the container image onto the target
>> rootfs at deployment time. However, our current deployment tooling does
>> not have a full container engine available. Hence also in this case a
>> standalone tool is needed which is able to install a container image
>> such that it can be directly consumed by the container runtime later at
>> first boot of the final system.
>>
>>>
>>> It is almost always easier to do it as a post build step. In particular
>>> with all the filesystem back ends, union layers, 3rd party elements,
>>> etc, etc that come into play.
>>>
>>> I find that a lot of folks want the build system to do more automation
>>> and steps in this area, when it doesn't make a lot of sense.
>>>
>>> But again, it is something you can do in your own layers, everything
>>> to do it is available.
>>>
>>>>
>>>> Since OpenEmbedded is the tooling to build the container runtime image
>>>> as well as the container itself, all those steps preferably should be
>>>> handled in OE as well.
>>>
>>> I disagree on that point (to a degree). Assembling final images outside
>>> of the build system from the artifacts is almost always faster and
>>> more flexible. But I digress, this isn't the important part of what you
>>> are looking for.
>>
>> When it comes to preinstalling I agree.
>>
>> However, building the container image with all its metadata, I feel it
>> would be much nicer if that part would be solved within OE.
>>
>> E.g. having an image.bb which has a bunch of variables set which specify
>> the application containers executable, environment, container
>> settings...
>>
> 
> There aren't a lot of settings actually in the metadata of the
> container image (since it wouldn't be all that useful with it), but
> yes, there are some (like env variables, arguments, entry point,
> etc). They are controlled largely by the config.json which is
> a very dynamic configuration and is easily generated at runtime.
> 

What tooling are you using to generate this configuration at runtime?

I guess it depends what container you exactly build. I think of a e.g.
Qt application built using OE. In that case, your recipe knows exactly
what the executable will be, which environment variables you want to
have set, and what your working directory should be.

If I have tooling outside OE, then I need to spread information about
this particular Qt application across different systems.

> Many of the values aren't known at build time, or if they are
> known, it is a very inflexible way of specifying them. Being able
> to adapt the settings at runtime is much more powerful.
> 
>> There are also virtualization image types such as vdi or qcow2. In the
>> container world OCI Image Format seems rather common, so wouldn't it
>> also make sense to have a image type for it?
> 
> We could do this in a bbclass in meta-virt for now (I really don't think
> it belongs in oe-core right now, since the cadence of the various parts
> is "interesting"), but I also still think it would be a very
> limited construction of the image, since you do want many of the
> values to be generated at runtime.

Agreed, it would be a very limited construction (e.g. single layer, only
some metadata configurable).

I see a lot of use cases where that work flow won't be the right one.
But if you have a polished application built with OE, it seems a
reasonable approach.

> 
> In the end, I don't think it buys you very much having it integrated
> (except perhaps some settings and metadata that were set in bitbake/oe
> /recipes and impact some parts of the container image creation).
> 
> I could move some of the tooling around, and pull together a RFC
> patch if there's interest.

Yes, definitely interested.

--
Stefan


> 
> Cheers,
> 
> Bruce
> 
>>
>> --
>> Stefan
>>
>>>
>>>>
>>>> It seems to me that umoci is the tool we are looking for. Is this
>>>> available as -native?
>>>
>>> It very likely is what you need. A host tool + a very thin bbclass in
>>> your layer to generate the oci bundle.
>>>
>>> It could be extended to be a host tool. I just haven't had the use case
>>> for it yet (I use it on target).
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>>
>>>> --
>>>> Stefan
>>>>
>>>>>
>>>>> I've been doing similar things for quite some time in meta-cube
>>>>> i.e. http://layers.openembedded.org/layerindex/recipe/87474/
>>>>>
>>>>> But that all happens outside of the build system.
>>>>>
>>>>> I could move more of the tools over to meta-virt, if there's
>>>>> interest.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Bruce
>>>>>
>>>>>>
>>>>>> --
>>>>>> Stefan
>>>>>>

