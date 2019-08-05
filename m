Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 884BEE00D47; Mon,  5 Aug 2019 07:45:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BE01E006EE
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 07:45:08 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x75EiUHj009435
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Aug 2019 07:44:41 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 5 Aug 2019 07:44:20 -0700
To: ChenQi <Qi.Chen@windriver.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
	<20190805060143.24108-2-Qi.Chen@windriver.com>
	<CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com>
	<62ce21c1-d9c9-7c83-5282-793c1a055f3f@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <2b9ef4d5-8d38-f314-e3fc-c23a77650a84@windriver.com>
Date: Mon, 5 Aug 2019 09:44:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <62ce21c1-d9c9-7c83-5282-793c1a055f3f@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/4] runc: remove static to enable building systemd support
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
X-List-Received-Date: Mon, 05 Aug 2019 14:45:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/5/19 7:05 AM, ChenQi wrote:
> On 08/05/2019 07:28 PM, Bruce Ashfield wrote:
>>
>>
>> On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, <Qi.Chen@windriver.com
>> <mailto:Qi.Chen@windriver.com>> wrote:
>>
>>     Remove the 'static' from do_compile to enable systemd support.
>>     This avoid runtime error is docker's cgroup driver is set to systemd
>>     on systemd based images.
>>
>>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>>     ---
>>      recipes-containers/runc/runc.inc | 2 +-
>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git a/recipes-containers/runc/runc.inc
>>     b/recipes-containers/runc/runc.inc
>>     index 46fd09d..1f2f944 100644
>>     --- a/recipes-containers/runc/runc.inc
>>     +++ b/recipes-containers/runc/runc.inc
>>     @@ -54,7 +54,7 @@ do_compile() {
>>             export CFLAGS=""
>>             export LDFLAGS=""
>>
>>     -       oe_runmake static
>>     +       oe_runmake
>>

runc is one of those things that may need to be static in some configurations.
Since it has security impact, updating runc (and the libc) should be done in
paralell and this can cause problems otherwise.

Now, that doesn't mean it HAS to be static, but it should be a configuration and
may be wise to have as the default to be static.

>>
>> This needs to be optional, via a packageconfig that can be overidden and that
>> can trigger a default of the init manager is systemd. (I actually want static
>> and systemd in my configs )
>>
>> Bruce
>>
> 
> So we introduce a PACKAGECONFIG, whose effect is using static when enabled and
> dropping static when disabled. By default, it's disabled if systemd is in use.

So PACKAGECONFIG is the right answer here.  I'm not sure what the right default
for the recipe is.... but in the end the users configuration and distro can and
should be able to select what they want.

--Mark

> Right?
> 
> Regards,
> Chen Qi
> 
>>      }
>>
>>      do_install() {
>>     -- 
>>     2.17.1
>>
>>     -- 
>>     _______________________________________________
>>     meta-virtualization mailing list
>>     meta-virtualization@yoctoproject.org
>>     <mailto:meta-virtualization@yoctoproject.org>
>>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
> 
> 


