Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31E6DE00B95; Tue, 20 Sep 2016 10:06:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C163BE00B74
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 10:06:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8KH6iin021916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Sep 2016 10:06:44 -0700
Received: from [172.25.59.212] (172.25.59.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 10:06:44 -0700
To: <mark.asselstine@windriver.com>
References: <1474313584-40091-1-git-send-email-jason.wessel@windriver.com>
	<CAPuovEJcD6mxJtB2KAPFnyyapNveJ4=oC9hj8kctZQYrS1JdKA@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <f2c066f2-9964-964f-8d27-081aaf6457ac@windriver.com>
Date: Tue, 20 Sep 2016 12:06:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAPuovEJcD6mxJtB2KAPFnyyapNveJ4=oC9hj8kctZQYrS1JdKA@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Tue, 20 Sep 2016 17:06:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2016 09:57 AM, Mark Asselstine wrote:
> On Mon, Sep 19, 2016 at 3:33 PM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> The go-cross package is explicitly for compiling target libraries on
>> the host system.  When the target architecture matches the host
>> architecture it will actually use the host's linker and compiler
>> however which can result in the generation of the cgo.a library having
>> linker symbols which might not work properly when compiling other
>> packages.
>>
>> A typical error looks like this when building consul-migrate:
>>
>> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/x86_64-linux/go/pkg/tool/linux_amd64/link: running x86_64-yocto-linux-gcc failed: exit status 1
>> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: /opt/build-intel-x86/tmp/work/core2-64-yocto-linux/consul-migrate/git-r0/build-tmp/go-link-956548052/000002.o: unrecognized relocation (0x2a) in section `.text'
>> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: final link failed: Bad value
>> collect2: error: ld returned 1 exit status
>>
>> The fix is to use the make.bash --target-only option to properly build
>> the libraries with the target toolchain.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>   recipes-devtools/go-cross/go-cross.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
>> index 613e9c7..c1577e3 100644
>> --- a/recipes-devtools/go-cross/go-cross.inc
>> +++ b/recipes-devtools/go-cross/go-cross.inc
>> @@ -26,6 +26,10 @@ do_compile() {
>>
>>       cd src
>>       ./make.bash --host-only
>> +    if [ "${GOARCH}" = "amd64" -a "${BUILD_ARCH}" = "x86_64" ] ; then
>> +        # Ensure cgo.a is built with the target toolchain
>> +        GO_FLAGS="-a" ./make.bash --target-only
>> +    fi
> Since this is a "cross" tool it really does have a foot in both camps.
> ie. it is not clearly something which is purely setup to run/exist on
> the build host, nor is it something being built to be installed and
> run on the target. It is rather something which is built to run on the
> host but has ties with the -native sysroot (for example some of the
> dependencies might exist not as part of the host system but only in
> the -native sysroot, and to a certain extent it might expect the
> sysroot has similarities to the target rootfs).
>
>  From what I can tell I believe that go-cross is being linked using the
> host's linker and link flags which allows it to build, but when it
> goes to be used as a crosstool it is attempting to use aspects of the
> -native sysroot and due to the mismatch in binutils versions and
> similar the result is the build failures we are seeing in
> consul-migrate. Your workaround forces the build and linking to be
> done as if we were building for the target, since if statement
> restricts this to when the GOARCH and BUILD_ARCH match, this allows it
> to function on the host as a crosstool. This is clever but could have
> side effects since it might use dynamic libs and tools not in the
> -native sysroot but actually in the -target sysroot, will this survive
> rmwork or when 'tmp' is wiped out and things are built from sstate?
>
> I have found another possible solution which doesn't have the possible
> side effects mentioned above.
>
> -      ./make.bash --host-only
> +     GO_EXTLINK_ENABLED="0" ./make.bash --host-only
>
> According to the make.bash text this will force usage of the internal
> linker and it appears that by using this instead of the host's linker
> the environment we have setup for when we do_compile allows the
> -native sysroot to be taken into account and the result is a proper
> mix of host vs. -native sysroot bindings. Ideally I would like to use
> the host LD and just pass the proper flags to allow a similar result
> to using the internal linker, but I have not had any success.
>
> Thoughts?


I believe we need to go even a step further and build out the ARM binaries when the host is X86_64.   What I found upon further investigation is that the sysroot is changed outside of a sysroot packaging rule.  The go-cross tool is the offender.  The first ARM package which needs go-cross will build and populate cgo.a into the sysroot directly.   This poses a problem with parallel package builds as well as controlling updates to the sysroot.

I created a v2 patch to address this secondary problem.

Jason.

