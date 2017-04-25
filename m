Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 976F6E00AF2; Tue, 25 Apr 2017 05:55:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.173 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13C74E00AE6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:55:34 -0700 (PDT)
Received: by mail-qk0-f173.google.com with SMTP id y63so113725150qkd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BSmBbWbUOvHXbhBW6KvjJ2JsYOz+iw1SqItn7mkkUq4=;
	b=ajjVJ2F3Dj61dDdlD5fxQFHybt8cD1W5U/orR2bVyzxbAyNG42pC9uBZHTpVP1VaUF
	2igrWJcVeFqi8LRFaBOXG4BMTpZA0bQImSQYd2Hd3+8XXEsm5zRqUhZ2W6uoRYqwG5dO
	EnNpjOSWrRjg4MSTLpR+28ws6+IrRynMmkR8WqxT9gvPyc+quk6Ac5EHXBW1kxOB6FjZ
	meTvv9rTsV9UFmAnI1Dio8Laqxy83H4zulwgXkDtJ9RtTjcoAvMjLP2uO3EJCyHZnDYa
	4ki9okg34Vh2m0U8kd40fil48rKzCvNr2fwbwzqg0e8qzO/dvexzsCsqho2Pub/q8K4t
	Kr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BSmBbWbUOvHXbhBW6KvjJ2JsYOz+iw1SqItn7mkkUq4=;
	b=unkPQcCncyoDyzC3YyDaEekWjcxWOJ471a+hp3CS0znVkS6r0uQbKTx7YIu/oNI+mn
	C2AbWvEAaxXLHvtydcRnHpgZshAIlUHChmYSQ4xY9/5pBoIHxYgoKjMC5r4F5X/S9Z+g
	L91l4NNGijMByzGmVjx2E5LUzR9mnuaHEVAgwP6gLcx2ee7friJTc96sy49BRkTdaYAl
	oKoOgn/mv7vLUCQiHF5JtWsBxn9/YC6eUYUwDlow6mRSXIMmW1c+BMFaUk3K0qqbbasp
	26rNOZghuN+7j9dtwmoI0643HAhdbIPlC1fBcuRIpaL+5dEIMkF2O8IF00j++/+3SYX/
	dChQ==
X-Gm-Message-State: AN3rC/6KYdek/moA4aw3Us44wSJSHmSvf9Xq4LCypbyj04A0XRxmEVw1
	OE30LiZlPFA5MrVs7gViWPPTuvLOfw==
X-Received: by 10.55.104.80 with SMTP id d77mr18632589qkc.56.1493124933857;
	Tue, 25 Apr 2017 05:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Tue, 25 Apr 2017 05:55:33 -0700 (PDT)
In-Reply-To: <CADM9VcvrsmBrBLpV4YNcgbh0BDok2VYo5FOGYYf6qW9xLx=_2Q@mail.gmail.com>
References: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
	<CADkTA4N6_OQwYVyH1qZAyMzRwBHxhpJNshxbjumkuhvcvWmVRw@mail.gmail.com>
	<CADM9VcugBHcqoTADm32TAFON8jCS-EYEJcgCuDQKc=b75HZrpQ@mail.gmail.com>
	<CADkTA4PcrhFes+bksBr_8A=i2GrkbwzFpO+rRVzwRAKb3E8Jfw@mail.gmail.com>
	<CADM9VcvrsmBrBLpV4YNcgbh0BDok2VYo5FOGYYf6qW9xLx=_2Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Apr 2017 08:55:33 -0400
Message-ID: <CADkTA4M3ifdX_98L6txX_nkswXLjqhDtkhUHXNA3arRHa86Kuw@mail.gmail.com>
To: Massimiliano Malisan <max.malisan.uk@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: LXD anyone?
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
X-List-Received-Date: Tue, 25 Apr 2017 12:55:36 -0000
Content-Type: multipart/alternative; boundary=94eb2c059d4249b60a054dfd3da3

--94eb2c059d4249b60a054dfd3da3
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 25, 2017 at 3:56 AM, Massimiliano Malisan <
max.malisan.uk@gmail.com> wrote:

>
>
> On 21 April 2017 at 19:03, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Fri, Apr 21, 2017 at 12:32 PM, Massimiliano Malisan <
>> max.malisan.uk@gmail.com> wrote:
>>
>>> Hi,
>>>
>>> well, it's a bit complicated: being a newbie of both Yocto and go-lang
>>> when I started all this I wasn't aware of the introduction of go in the
>>> openembedded-core meta master (I am using morty). As I couldn't sort out
>>> quickly how to set up the recipe with the meta-virtualization go compiler I
>>> switched all the meta to use meta-golang (quite an easy task), which seemed
>>> to me much more easy to use and directly produced a building tree structure
>>> similar to the one I got from "go get" of LXD source (which I used as a
>>> reference to understand all the package's dependencies and go building
>>> structure).
>>>
>>
>> I'm not so concerned about the variant of the go compiler used to build,
>> as long
>> as you found something that worked, it is something that we can merge.
>>
>> But yes, anything we merge now should work with oe-core's go variant,
>> since that
>> is what we are standardizing on.
>>
>
> Is the current/future standard the version in openembedded-core/meta or
> the one addressed in meta-virtualization README (git://github.com/error
> developer/oe-meta-go.git -- maybe superseded by github.com/mem/oe-meta-go
> )?
>

oe-core/meta is where standardization is happening.


>
> As I see some work to be done here (I have to switch all my repos to the
> master branch to do everything in a coherent environment), would it be fine
> if submit now the morty version and in the next future the master-compliant
> one?
>
>
>>
>>> Besides this:
>>> * I created a bunch of go recipes for all the dependencies (following
>>> the example of docker's recipe dependencies)
>>>
>>
>> These can be submitted to meta-virt, but packaging too many support
>> packages
>> isn't necessarily the right thing, since they can conflict with other go
>> packages that
>> need a similar dependency, but on another version.
>>
>> The technique that I've been using to deal with this lately is to put
>> multiple upstream
>> repos on the SRC_URI and allow the fetcher to pull them into the SRC
>> directory, and
>> have them available to the build.
>>
>> i.e. look at what I did for libnetwork in docker, you can do something
>> similar per-dependency
>> and use destsuffix= to get them in the right place (i.e.
>> destsuffix=git/src/github.com/openSUSE/umoci)
>>
>
> I see the point here, as I had started from morty versions I missed this
> approach; I just have to check if everything runs with this approach as
> some dependencies are taken from gopkg.in which is a kind of versioned
> git repository.. (but then, maybe, those can be kept as standalone recipes)
>

Some runtime dependencies and other support applications do make sense as
separate
packages, but when something is being pulled in to simply process command
line args, it
really doesn't make sense as a separate package. It just needs to be around
for the build
and then it is removed.


>
>
>
>> * I added and/or updated few other recipes (some are added+updated from
>>> meta-cube)
>>>
>>
>> These can be sent here, or sent as a pull request on the OverC github
>> pages, if you send
>> them here, make sure to have [meta-cube] in the subject. Or go right for
>> the github pull
>> request.
>>
>
> I think they are more appropriate here; just not to drag in another
> (almost unrelated) layer.
>

Sounds good. We can take them on a case by case basis. i.e. I'd rather not
move recipes
from between layers, but update them where they currently are. But
broadcasting the
work to this list definitely works.


>
>
>> * I added/changed some system configuration files
>>>
>>
>> We'd have to look at those closely, system level config is something that
>> either needs to
>> be controlled by packageconfigs, or is a distro policy. So they may not
>> be something
>> that you need to send at all.
>>
>
> Some are the various init config files (I tested the systemd one and
> quickly the sysvinit one) and most important one is the dnsmasq.conf, which
> locally (due to a meta-virt append) conflicts with a LXD dnsmasq setting
> taken from (again) the Ubuntu install package
>

Everyone (people and packages) love to poke with dnsmasq. Mark Asselstine
sent
changes to meta-oe that enabled the use of the dnsmasq.d configuration
directory
versus everything needing to modify dnsmasq.conf directly.

Regardless, we'd have to look at those changes carefully since there's no
one right
configuration for dnsmasq.

For init system files, they shouldn't be an issue.


>
>
>>
>> * I added some kernel modules - but without a real knowledge of which are
>>> strictly needed: I just checked those needed by docker (using the checking
>>> script from coreos docker's repo -- https://github.com/coreos/d
>>> ocker/blob/master/contrib/check-config.sh) and created corresponding
>>> kernel scc and cfg files (I also updated the docker's ones but this is a
>>> collateral and I don't know if it's needed).
>>>
>>
>> That would be fine, following what we do for docker makes sense.
>>
>
> My only concert is that I may have added some unnecessary kernel
> configurations here
>

When I see the patch, I can comment further.


>
>
>>
>>> Now I got a bit more insight on the overall process I may try to update
>>> the recipes to use the new go compiler structure (but for the moment I
>>> still need to keep it working for morty.. and I wouldn't like to keep two
>>> different versions of the recipes).
>>>
>>> By the way, now LXD seems to be working on my test image; there are
>>> still few thing I have to do manually after the installation (which should
>>> be automatized within the building process and I haven't been able to, yet)
>>> and few "side" things missing:
>>> * I could not build criu (as per previous message to the list) which is
>>> indicated as a tool to be used together with LXD on the build instructions
>>>
>>
>> unless you are doing container migration or snapshots, you can ignore it,
>> and even make
>> it an optional dependency.
>>
>>
>>> * I have not been able to use it with apparmor (I didn't manage to build
>>> it from the meta-security)
>>>
>>
>> this would be optional anyway, apparmor is a distro type config, and
>> building it in, or out, of
>> LXD would be a packageconfig or distro feature.
>>
>>
>>> * In his blog, LXD main developer suggests to use ZFS as ideal container
>>> fs but it's currently missing from Yocto...
>>>
>>
>> I wouldn't worry about this either, we can't dictate the FS that people
>> use, so the recipes need
>> to be generic and that's up to the distro or image assembler.
>>
>
> Yes, I named the above as "side" missing parts as I know they are not
> strictly necessary but it was to clarify that atm this package is not as
> complete as an Ubuntu user may expect it to be.
>
> If is ok that I start with the morty packages, I will submit the pull
> requests in the next few days and then look after the master recipes after
> that.
>

Sounds ok to me.

Bruce


>
> Cheers,
>     Max
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c059d4249b60a054dfd3da3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 25, 2017 at 3:56 AM, Massimiliano Malisan <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:max.malisan.uk@gmail.com" target=3D"_blank">max.mali=
san.uk@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
"><span>On 21 April 2017 at 19:03, Bruce Ashfield <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><span class=3D"m_-6304842535470183170m_-793919296923394216=
5gmail-">On Fri, Apr 21, 2017 at 12:32 PM, Massimiliano Malisan <span dir=
=3D"ltr">&lt;<a href=3D"mailto:max.malisan.uk@gmail.com" target=3D"_blank">=
max.malisan.uk@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>well, it&#=
39;s a bit complicated: being a newbie of both Yocto and go-lang when I sta=
rted all this I wasn&#39;t aware of the introduction of go in the openembed=
ded-core meta master (I am using morty).=C2=A0As I couldn&#39;t sort out qu=
ickly how to set up the recipe with the meta-virtualization go compiler I s=
witched all the meta to use meta-golang (quite an easy task), which seemed =
to me much more easy to use and directly produced a building tree structure=
 similar to the one I got from &quot;go get&quot; of LXD source (which I us=
ed as a reference to understand all the package&#39;s dependencies and go b=
uilding structure).</div></div></blockquote><div><br></div></span><div>I&#3=
9;m not so concerned about the variant of the go compiler used to build, as=
 long</div><div>as you found something that worked, it is something that we=
 can merge.</div><div><br></div><div>But yes, anything we merge now should =
work with oe-core&#39;s go variant, since that</div><div>is what we are sta=
ndardizing on.</div></div></div></div></blockquote><div><br></div></span><d=
iv>Is the current/future standard the version in openembedded-core/meta or =
the one addressed in meta-virtualization README=C2=A0(git://<a href=3D"http=
://github.com/errordeveloper/oe-meta-go.git" target=3D"_blank">github.com/e=
rror<wbr>developer/oe-meta-go.git</a> -- maybe superseded by=C2=A0<a href=
=3D"http://github.com/mem/oe-meta-go" target=3D"_blank">github.com/mem/oe-m=
eta-go</a>)?</div></div></div></div></blockquote><div><br></div><div>oe-cor=
e/meta is where standardization is happening.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><div><br></div><div>As I see some work to be done here =
(I have to switch all my repos to the master branch to do everything in a c=
oherent environment), would it be fine if submit now the morty version and =
in the next future the master-compliant one?=C2=A0</div><span><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"m_-6304842=
535470183170m_-7939192969233942165gmail-"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Besides this:</div><d=
iv>* I created a bunch of go recipes for all the dependencies (following th=
e example of docker&#39;s recipe dependencies)</div></div></blockquote><div=
><br></div></span><div>These can be submitted to meta-virt, but packaging t=
oo many support packages</div><div>isn&#39;t necessarily the right thing, s=
ince they can conflict with other go packages that</div><div>need a similar=
 dependency, but on another version.</div><div><br></div><div>The technique=
 that I&#39;ve been using to deal with this lately is to put multiple upstr=
eam</div><div>repos on the SRC_URI and allow the fetcher to pull them into =
the SRC directory, and</div><div>have them available to the build.</div><di=
v><br></div><div>i.e. look at what I did for libnetwork in docker, you can =
do something similar per-dependency</div><div>and use destsuffix=3D to get =
them in the right place (i.e. destsuffix=3Dgit/src/<a href=3D"http://github=
.com/openSUSE/umoci" target=3D"_blank">github.com/<wbr>openSUSE/umoci</a>)<=
/div></div></div></div></blockquote><div>=C2=A0</div></span><div>I see the =
point here, as I had started from morty versions I missed this approach; I =
just have to check if everything runs with this approach as some dependenci=
es are taken from <a href=3D"http://gopkg.in" target=3D"_blank">gopkg.in</a=
> which is a kind of versioned git repository.. (but then, maybe, those can=
 be kept as standalone recipes)</div></div></div></div></blockquote><div><b=
r></div><div>Some runtime dependencies and other support applications do ma=
ke sense as separate</div><div>packages, but when something is being pulled=
 in to simply process command line args, it</div><div>really doesn&#39;t ma=
ke sense as a separate package. It just needs to be around for the build</d=
iv><div>and then it is removed.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><span><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><span class=3D"m_-6304842535470183170m_-793919296923394216=
5gmail-"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>* I added and/or updated few other recipes (some are added+updated fr=
om meta-cube)</div></div></blockquote><div><br></div></span><div>These can =
be sent here, or sent as a pull request on the OverC github pages, if you s=
end</div><div>them here, make sure to have [meta-cube] in the subject. Or g=
o right for the github pull</div><div>request.</div><span class=3D"m_-63048=
42535470183170m_-7939192969233942165gmail-"><div></div></span></div></div><=
/div></blockquote><div><br></div></span><div>I think they are more appropri=
ate here; just not to drag in another (almost unrelated) layer.</div></div>=
</div></div></blockquote><div><br></div><div>Sounds good. We can take them =
on a case by case basis. i.e. I&#39;d rather not move recipes</div><div>fro=
m between layers, but update them where they currently are. But broadcastin=
g the</div><div>work to this list definitely works.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><span><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><span class=3D"m_-6304842535470183170m_-793919296923394=
2165gmail-"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>* I added/changed some system configuration files</div></div></blo=
ckquote><div><br></div></span><div>We&#39;d have to look at those closely, =
system level config is something that either needs to</div><div>be controll=
ed by packageconfigs, or is a distro policy. So they may not be something</=
div><div>that you need to send at all.</div><span class=3D"m_-6304842535470=
183170m_-7939192969233942165gmail-"><div></div></span></div></div></div></b=
lockquote><div><br></div></span><div>Some are the various init config files=
 (I tested the systemd one and quickly the sysvinit one) and most important=
 one is the dnsmasq.conf, which locally (due to a meta-virt append) conflic=
ts with a LXD dnsmasq setting taken from (again) the Ubuntu install package=
</div></div></div></div></blockquote><div><br></div><div>Everyone (people a=
nd packages) love to poke with dnsmasq. Mark Asselstine sent</div><div>chan=
ges to meta-oe that enabled the use of the dnsmasq.d configuration director=
y</div><div>versus everything needing to modify dnsmasq.conf directly.</div=
><div><br></div><div>Regardless, we&#39;d have to look at those changes car=
efully since there&#39;s no one right</div><div>configuration for dnsmasq.<=
/div><div><br></div><div>For init system files, they shouldn&#39;t be an is=
sue.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_extra"><div class=3D"gmail_quote"><span><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"m_-630484253=
5470183170m_-7939192969233942165gmail-"><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>* I added some kernel m=
odules - but without a real knowledge of which are strictly needed: I just =
checked those needed by docker (using the checking script from coreos docke=
r&#39;s repo --=C2=A0<a href=3D"https://github.com/coreos/docker/blob/maste=
r/contrib/check-config.sh" target=3D"_blank">https://github.com/coreos/d<wb=
r>ocker/blob/master/contrib/chec<wbr>k-config.sh</a>) and created correspon=
ding kernel scc and cfg files (I also updated the docker&#39;s ones but thi=
s is a collateral and I don&#39;t know if it&#39;s needed).</div></div></bl=
ockquote><div><br></div></span><div>That would be fine, following what we d=
o for docker makes sense.</div></div></div></div></blockquote><div><br></di=
v></span><div>My only concert is that I may have added some unnecessary ker=
nel configurations here</div></div></div></div></blockquote><div><br></div>=
<div>When I see the patch, I can comment further.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><span><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><span class=3D"m_-6304842535470183170m_-79391929692339421=
65gmail-"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div><br></div><div>Now I got a bit more insight on the overall process I=
 may try to update the recipes to use the new go compiler structure (but fo=
r the moment I still need to keep it working for morty.. and I wouldn&#39;t=
 like to keep two different versions of the recipes).</div><div><br></div><=
div>By the way, now LXD seems to be working on my test image; there are sti=
ll few thing I have to do manually after the installation (which should be =
automatized within the building process and I haven&#39;t been able to, yet=
) and few &quot;side&quot; things missing:</div><div>* I could not build cr=
iu (as per previous message to the list) which is indicated as a tool to be=
 used together with LXD on the build instructions</div></div></blockquote><=
div><br></div></span><div>unless you are doing container migration or snaps=
hots, you can ignore it, and even make</div><div>it an optional dependency.=
</div><span class=3D"m_-6304842535470183170m_-7939192969233942165gmail-"><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>* I have not been able to use it with apparmor (I didn&#39;t =
manage to build it from the meta-security)</div></div></blockquote><div><br=
></div></span><div>this would be optional anyway, apparmor is a distro type=
 config, and building it in, or out, of=C2=A0</div><div>LXD would be a pack=
ageconfig or distro feature.</div><span class=3D"m_-6304842535470183170m_-7=
939192969233942165gmail-"><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div>* In his blog, LXD main developer s=
uggests to use ZFS as ideal container fs but it&#39;s currently missing fro=
m Yocto...</div></div></blockquote><div><br></div></span><div>I wouldn&#39;=
t worry about this either, we can&#39;t dictate the FS that people use, so =
the recipes need</div><div>to be generic and that&#39;s up to the distro or=
 image assembler.</div><span class=3D"m_-6304842535470183170m_-793919296923=
3942165gmail-"><div></div></span></div></div></div></blockquote><div><br></=
div></span><div>Yes, I named the above as &quot;side&quot; missing parts as=
 I know they are not strictly necessary but it was to clarify that atm this=
 package is not as complete as an Ubuntu user may expect it to be.</div><di=
v><br></div><div>If is ok that I start with the morty packages, I will subm=
it the pull requests in the next few days and then look after the master re=
cipes after that.</div></div></div></div></blockquote><div><br></div><div>S=
ounds ok to me.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><div>=C2=A0<br></div><div>Cheers,</div><div>=C2=A0 =C2=
=A0 Max</div><div><br></div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_-6304842535470183170gmail_signature" data-smartmail=3D"gmail_signatur=
e">&quot;Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end&quot;</div>
</div></div>

--94eb2c059d4249b60a054dfd3da3--
