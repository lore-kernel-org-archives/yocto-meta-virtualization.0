Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23AB3E00A75; Fri,  6 Apr 2018 05:46:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB104E005A9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 05:46:37 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id q9-v6so370854lfk.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9sfbjjS18HjU5OQfFOlpxvyPveBSH4bdujLFq/3RUc8=;
	b=mCFkNkhxT1+4gMh6RtUA3+InRZvjk7pduH5x0yH37NL0re0Yw5cXQ8jhPT56zrJI1Q
	ohdNAQ0+uxC+tXRJobA388c+m/FIuEh4pdz7MSl4beudb8ijbygECni5XsRJgGkCNouv
	BnzrBOzivsGVsY1TTBaay8wyUjoXPdtoImh9gTwKwGI98E9kCo5uqVWhc8hk80Q9/NRC
	jqm8adzGsgLFCrbFaDH9Q5m1UQw8HM8jOztlfIwujd+S9d27dxk5e7CI/FTo76as0W90
	IIgGbK7gxU2rcYEJyazC2zcf1nOB6WdmI4tH3fSPZaMGs+UoA/GWhXxRH5wRAgORIdNY
	sEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9sfbjjS18HjU5OQfFOlpxvyPveBSH4bdujLFq/3RUc8=;
	b=gqIq9UANypBt04w3/TkH8qFhwB7OjvPZi0lxbK31BBuy4GOlmezIh+ujTCUUKWOuLt
	PV6u+rOVxpTY9xkV0fcli0Csu362hv3PSAVT0eYNUU57+P2EKkE9CRJclpRqYeV3Ab6G
	bDrIivWx/xN7BV67eYEQ0g7HnNT/9MNAYINbTpBATlwnR5sSYxJD+m1CHvFHMaVC3/di
	9UmC5D12pU3IvzdxadXK5XJ4aHWZuIpqoIA33ovNc/2hJ6o6wfZUla4L9gVpG1iA33+x
	6fgIpRX1dRIwQd8Blv8UPOlyWBFByRM3r/ADDeRHIZadyMufZn6KNHM72Xy3hRvyPb0n
	SwDg==
X-Gm-Message-State: ALQs6tCmEOvtiGcQQlrl+Up2ipQlhZ6WyKtTho1WlZd8iOECtkhBdk/e
	PldoCt1n0K/ZYaI5FMcI3N4HAJcLJeLexEUoeCY=
X-Google-Smtp-Source: AIpwx49dOIIx0EWYFoyxkRws6mzEOKUXsbBRGruJd9gUVNVmq00PJNUCa2/i8GpLmFz7h+B92vSJ8b30ixtyQvbz8C0=
X-Received: by 10.46.9.148 with SMTP id 142mr16663926ljj.129.1523018795882;
	Fri, 06 Apr 2018 05:46:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 6 Apr 2018 05:46:35 -0700 (PDT)
In-Reply-To: <CADkTA4PmRh3uft80szZ7KqJU-V8wCcHpAAu6=3EFHcutWASHjA@mail.gmail.com>
References: <d08821dd-51e6-f69c-c2c4-27798bcb7794@siemens.com>
	<CADkTA4PmRh3uft80szZ7KqJU-V8wCcHpAAu6=3EFHcutWASHjA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Apr 2018 08:46:35 -0400
Message-ID: <CADkTA4MCvT_Pdx2BF67+yT9dg5XWnwqcSCi5=5YbK452X9Yf-A@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Raymond Danks <ray.danks@se-eng.com>, meta-virtualization@yoctoproject.org
Subject: Re: docker-proxy links against host libraries
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
X-List-Received-Date: Fri, 06 Apr 2018 12:46:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 6, 2018 at 8:38 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Fri, Apr 6, 2018 at 7:48 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>> Hello
>>
>> I observed some strange linking problem with the "docker-proxy" when building for qemux86-64.
>>
>> It seems that the binary is linked against the host version of
>>
>> ```
>> $ file image/usr/bin/docker-proxy
>> image/usr/bin/docker-proxy: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, not stripped
>>                                                                                                                  ^^^^^^
>> ```
>>
>> I only noticed the issue on my build as it is a multi lib Debian where the libraries are under /lib64 and /lib32.
>> However on the target there there is only /lib to the binary did not work there.
>>
>> Only the docker-proxy binary is affected by this, the other binaries (docker, dockerd) are fine.
>>
>> ```
>> $ file image/usr/bin/docker
>> image/usr/bin/docker: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=c118d2393c7932172ca3e183bb304fe1cff73ce5, not stripped
>> ```
>>
>> I tried to fix the recipe by replacing the build command for docker-proxy [1] with the following line:
>>
>> ```
>> ${GO} build ${GOBUILDFLAGS} -o ${S}/src/import/docker-proxy github.com/docker/libnetwork/cmd/proxy
>> ```
>>
>> But without success the linked loader is still wrong.
>>
>> It is also worth mentioning that this only happens with x86_64 builds (tried: qemux86-64, genericx64-64) but not with other architectures like armv7.
>> I was also able to reproduce this on poky master today (commit: 9ed34e315a8d2db58e212b0770dfa8f4ad00f637).
>
>
> But what meta-virt commit is your head ?
>
>>
>>
>> The only solution I found so far is to put the docker-proxy into a separate recipe and add it as a RDEPENDS to docker.
>> I will submit a patch for this and you can decide if this would be an acceptable solution.
>
> I don't see what a separate recipe has to do with a fix. I'd rather
> keep the build
> all in one place.
>
> I guess I can wait to see the recipe, but what's different in that
> recipe in the way
> that docker-proxy is built, that can't be done in the existing recipe ?
>

I can see a similar link pattern here (but this would have been an
existing issue, unrelated to the recent docker uprevs), so I'll have a
go at fixing it this morning.

Bruce

> Bruce
>
>>
>> Regards
>> Pascal
>>
>> [1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker_git.bb#n119
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

