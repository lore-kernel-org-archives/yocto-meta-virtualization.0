Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0FD6E0090A; Tue, 11 Sep 2018 10:19:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C11DEE0053F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 10:19:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8BHJCkO009950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Sep 2018 10:19:12 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 11 Sep 2018 10:19:11 -0700
To: Stefan Agner <stefan@agner.ch>
References: <a9421b92abcdbc3c76f9bd6783cc0c5a@agner.ch>
	<8d25ae3a-6f8a-7b45-33e0-1564dce82eb2@windriver.com>
	<203ab06d2498d62ef1bedbb43c49d144@agner.ch>
	<e7157948-3b1a-3d76-9f1a-d3c69ba3dd17@windriver.com>
	<bf84980bf3dfbba8462041373596e58f@agner.ch>
	<861eeded-4404-939a-b8fa-150640d12cbc@windriver.com>
	<8b419833a091b25a8c21865e06edd0c5@agner.ch>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <a754e752-ab5d-d012-a98b-d03418224c47@windriver.com>
Date: Tue, 11 Sep 2018 13:19:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8b419833a091b25a8c21865e06edd0c5@agner.ch>
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
X-List-Received-Date: Tue, 11 Sep 2018 17:19:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/11/2018 01:01 PM, Stefan Agner wrote:
> On 11.09.2018 04:14, Bruce Ashfield wrote:
>> On 2018-09-11 12:37 AM, Stefan Agner wrote:
>>> On 10.09.2018 18:10, Bruce Ashfield wrote:
>>>> On 2018-09-10 9:01 PM, Stefan Agner wrote:
>>>>> On 10.09.2018 17:34, Bruce Ashfield wrote:
>>>>>> On 2018-09-10 7:21 PM, Stefan Agner wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Is there a OpenEmbedded image type which allows to build images which
>>>>>>> are OCI Image Format compliant? meta-virtualization includes the
>>>>>>> oci-image-tools, hence the recipe for tooling is there. There is
>>>>>>> currently no -native support for oci-image-tool and its dependencies,
>>>>>>> but I guess that shouldn't be too far away. Any thoughts?
>>>>>>
>>>>>> This is something that we typically do with umoci, not with the
>>>>>> raw tools.
>>>>>>
>>>>>> re-inventing what better tools already do in a bbclass using
>>>>>> the raw oci-image-tools is an not an exercise worth doing.
>>>>>>
>>>>>> Not to mention, nearly every use case I currently have for
>>>>>> working with container images, involves registries, and adding
>>>>>> something as clunky as a build system to generate the images
>>>>>> just doesn't make sense.
>>>>>>
>>>>>> How were you planning on running/using the OCI bundles ?
>>>>>
>>>>> I am not very familiar with OCI and its tools yet, so quite possible I
>>>>> am on the wrong track here.
>>>>>
>>>>> What we are looking for is a way to build an image using OE, generate a
>>>>> container from it and push it to a registry. The last operation is
>>>>> probably a separate/manual step, but ideally OE should build the tools
>>>>> for it.
>>>>
>>>> Right, this is a function of meta-virtualization. You could use the
>>>> raw tools, but as I mentioned ... you would be unwise to try and
>>>> duplicate everything that much more complex tools already do.
>>>>
>>>
>>> Just to clarify, I meant to do all those steps on the build host. Hence
>>> those tools would be required as -native.
>>>
>>>>>
>>>>> A second use case is where we build the container runtime image, but
>>>>> also the container image using OE. In this case the container image
>>>>> should get installed at OE build time onto the container runtime rootfs.
>>>>
>>>> That's something you need to do in your own layers/image definitions.
>>>> There's nothing really special needed for this, just image definitions
>>>> and dependencies.
>>>>
>>>> I've done similar things in the past, and almost always walked away from
>>>> it (virtualization based images with already installed VM images). Since
>>>> the inflexibility of needing to build and re-assemble the image
>>>> outweighs the benefits you think you are getting.
>>>
>>> I am worried that preinstalling the container might be inflexibel too.
>>>
>>> We were thinking to preinstall the container image onto the target
>>> rootfs at deployment time. However, our current deployment tooling does
>>> not have a full container engine available. Hence also in this case a
>>> standalone tool is needed which is able to install a container image
>>> such that it can be directly consumed by the container runtime later at
>>> first boot of the final system.
>>>
>>>>
>>>> It is almost always easier to do it as a post build step. In particular
>>>> with all the filesystem back ends, union layers, 3rd party elements,
>>>> etc, etc that come into play.
>>>>
>>>> I find that a lot of folks want the build system to do more automation
>>>> and steps in this area, when it doesn't make a lot of sense.
>>>>
>>>> But again, it is something you can do in your own layers, everything
>>>> to do it is available.
>>>>
>>>>>
>>>>> Since OpenEmbedded is the tooling to build the container runtime image
>>>>> as well as the container itself, all those steps preferably should be
>>>>> handled in OE as well.
>>>>
>>>> I disagree on that point (to a degree). Assembling final images outside
>>>> of the build system from the artifacts is almost always faster and
>>>> more flexible. But I digress, this isn't the important part of what you
>>>> are looking for.
>>>
>>> When it comes to preinstalling I agree.
>>>
>>> However, building the container image with all its metadata, I feel it
>>> would be much nicer if that part would be solved within OE.
>>>
>>> E.g. having an image.bb which has a bunch of variables set which specify
>>> the application containers executable, environment, container
>>> settings...
>>>
>>
>> There aren't a lot of settings actually in the metadata of the
>> container image (since it wouldn't be all that useful with it), but
>> yes, there are some (like env variables, arguments, entry point,
>> etc). They are controlled largely by the config.json which is
>> a very dynamic configuration and is easily generated at runtime.
>>
> 
> What tooling are you using to generate this configuration at runtime?
> 

It's a function of the oci-runtime-tools. They handle this sort of
configuration and generation of the config.json.

> I guess it depends what container you exactly build. I think of a e.g.
> Qt application built using OE. In that case, your recipe knows exactly
> what the executable will be, which environment variables you want to
> have set, and what your working directory should be.
> 
> If I have tooling outside OE, then I need to spread information about
> this particular Qt application across different systems.

True. But the entry point of the container is a very tiny part
of that application. If you are encoding too much of the application
run into the meta data and container format, it isn't all that
useful of a container (from some requirements/points of view).

i.e. the container is very static in this example, but that really
isn't the case for most use cases once something is deployed.

Most of the use cases for extension also do not want to go back
to the build system for extension of the container, if everything
about the application is buried in some sort of hard to read
recipe-space meta-data .. or if another layer wants to overlay
configuration due to security or other inputs .. it is very painful
to do. I can tweak the runtime config of a container in seconds,
versus having to go back to the build system.

This is why the kernel configuration is in the kernel-cache, versus
sprayed around multiple layers. So burying things into the recipe
that built it is quite a narrow focus from that point of view.

You can just as easily have that portability with a tgz, runc
and the oci-runtime-tools, and you aren't binding yourself to
the build system for simple configuration extensions. Which is
to say, there are many options.

> 
>> Many of the values aren't known at build time, or if they are
>> known, it is a very inflexible way of specifying them. Being able
>> to adapt the settings at runtime is much more powerful.
>>
>>> There are also virtualization image types such as vdi or qcow2. In the
>>> container world OCI Image Format seems rather common, so wouldn't it
>>> also make sense to have a image type for it?
>>
>> We could do this in a bbclass in meta-virt for now (I really don't think
>> it belongs in oe-core right now, since the cadence of the various parts
>> is "interesting"), but I also still think it would be a very
>> limited construction of the image, since you do want many of the
>> values to be generated at runtime.
> 
> Agreed, it would be a very limited construction (e.g. single layer, only
> some metadata configurable).
> 
> I see a lot of use cases where that work flow won't be the right one.
> But if you have a polished application built with OE, it seems a
> reasonable approach.

In that case, you are just using the container as a package, so
yes, it can apply in this case. But in my experience, once you
start working with the containers, it is going to be needed to
be updated via those same containers, and you aren't necessarily
going to be reaching back into that original build to do that
extension and delivery of the updated container, it is a more
dynamic process.

But absolutely, it is a valid use case. I'm just suggesting it
is one of many, so I wouldn't design everything around it.

> 
>>
>> In the end, I don't think it buys you very much having it integrated
>> (except perhaps some settings and metadata that were set in bitbake/oe
>> /recipes and impact some parts of the container image creation).
>>
>> I could move some of the tooling around, and pull together a RFC
>> patch if there's interest.
> 
> Yes, definitely interested.

ok. I'll start pulling something together to address the more static
container as a package use case.

Cheers,

Bruce

> 
> --
> Stefan
> 
> 
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> --
>>> Stefan
>>>
>>>>
>>>>>
>>>>> It seems to me that umoci is the tool we are looking for. Is this
>>>>> available as -native?
>>>>
>>>> It very likely is what you need. A host tool + a very thin bbclass in
>>>> your layer to generate the oci bundle.
>>>>
>>>> It could be extended to be a host tool. I just haven't had the use case
>>>> for it yet (I use it on target).
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>> --
>>>>> Stefan
>>>>>
>>>>>>
>>>>>> I've been doing similar things for quite some time in meta-cube
>>>>>> i.e. http://layers.openembedded.org/layerindex/recipe/87474/
>>>>>>
>>>>>> But that all happens outside of the build system.
>>>>>>
>>>>>> I could move more of the tools over to meta-virt, if there's
>>>>>> interest.
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> Stefan
>>>>>>>


