Return-Path: <max.malisan.uk@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57A54E00AF0; Tue, 25 Apr 2017 00:56:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (max.malisan.uk[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.193 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8A99E00AE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 00:56:42 -0700 (PDT)
Received: by mail-io0-f193.google.com with SMTP id k87so52587802ioi.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BswH1KYflzAicYdaAAcZDm/ZDo2+dafU2MnakSlxKtE=;
	b=QquzZzxCZGOKzxLhK68O7qPS5oGGC50RBwZSUujJtUsGo8/f1nuGxqsR4eqHdI0D9V
	HH0Zus0v+9ZlMK2geBntt10MvcCB5AUYdOpvfZPean19eKExAaphQjFwzOSR2in8qK6E
	+zXafQxHpuLPU3ScVQvA4OJ+5OVvBnbPum3sFE/cRt8D+BtSkJ7YptS0sBBYGm0c1KQ3
	rm+VPF2yPqxKqvQEvfby+k2XgA0fOA1KE0bwSIq/DTJ3XIhYhkrVo4EBxqEQ12r8Ixy3
	ykVVy9AKj7F+a+IstAeNchuoEy9yQM0ViKVjuSsFBPKs4IgQMB+tPBRgdcFZgCUJ8mBD
	OCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BswH1KYflzAicYdaAAcZDm/ZDo2+dafU2MnakSlxKtE=;
	b=O9/+JA3COsl8qWdKA+hl8Qd2k/bsESaIxqf07sZLpHpKePvBZwJ8/SfZuSFJ6XUs1e
	8m8hh57e2aFzPkSvysBiVZ2+mIkLlxS8Cjx9AS3bmQiSzLMiExCvjc8SshfQah81NHVP
	wOy8WNpcgED+jAO2MARMlV5tZ0WXFhRylq+Xo/EHu2PfJKIPUMaTMPFfByzOlkRxMUQZ
	Bh4rkpfT/D+Qq6PaFsk/C4OFNuPncGXDbbUgR5XufuzGRpVaqL2+SqO95yMK0z6anXno
	xo4s5vQHrrr0PhSyfR4mG25MqdK/u4EK/ZdeqNvNhpfsq4Kwe/J4OxKkJi+JZG5KRlvq
	0q/A==
X-Gm-Message-State: AN3rC/6UXcn3XrMDdoPPD612AI0NucD96iJ0ln0oZfLTYawqTzNoz3C6
	FvSuXqyJZqpasFmLxYrQQTczKE4H/KUA
X-Received: by 10.107.186.134 with SMTP id k128mr11716449iof.83.1493107001487; 
	Tue, 25 Apr 2017 00:56:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.164.11 with HTTP; Tue, 25 Apr 2017 00:56:40 -0700 (PDT)
In-Reply-To: <CADkTA4PcrhFes+bksBr_8A=i2GrkbwzFpO+rRVzwRAKb3E8Jfw@mail.gmail.com>
References: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
	<CADkTA4N6_OQwYVyH1qZAyMzRwBHxhpJNshxbjumkuhvcvWmVRw@mail.gmail.com>
	<CADM9VcugBHcqoTADm32TAFON8jCS-EYEJcgCuDQKc=b75HZrpQ@mail.gmail.com>
	<CADkTA4PcrhFes+bksBr_8A=i2GrkbwzFpO+rRVzwRAKb3E8Jfw@mail.gmail.com>
From: Massimiliano Malisan <max.malisan.uk@gmail.com>
Date: Tue, 25 Apr 2017 08:56:40 +0100
Message-ID: <CADM9VcvrsmBrBLpV4YNcgbh0BDok2VYo5FOGYYf6qW9xLx=_2Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Tue, 25 Apr 2017 07:56:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c06d3646f7698054df910fc

--94eb2c06d3646f7698054df910fc
Content-Type: text/plain; charset=UTF-8

On 21 April 2017 at 19:03, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

>
>
> On Fri, Apr 21, 2017 at 12:32 PM, Massimiliano Malisan <
> max.malisan.uk@gmail.com> wrote:
>
>> Hi,
>>
>> well, it's a bit complicated: being a newbie of both Yocto and go-lang
>> when I started all this I wasn't aware of the introduction of go in the
>> openembedded-core meta master (I am using morty). As I couldn't sort out
>> quickly how to set up the recipe with the meta-virtualization go compiler I
>> switched all the meta to use meta-golang (quite an easy task), which seemed
>> to me much more easy to use and directly produced a building tree structure
>> similar to the one I got from "go get" of LXD source (which I used as a
>> reference to understand all the package's dependencies and go building
>> structure).
>>
>
> I'm not so concerned about the variant of the go compiler used to build,
> as long
> as you found something that worked, it is something that we can merge.
>
> But yes, anything we merge now should work with oe-core's go variant,
> since that
> is what we are standardizing on.
>

Is the current/future standard the version in openembedded-core/meta or the
one addressed in meta-virtualization README (git://
github.com/errordeveloper/oe-meta-go.git -- maybe superseded by
github.com/mem/oe-meta-go)?

As I see some work to be done here (I have to switch all my repos to the
master branch to do everything in a coherent environment), would it be fine
if submit now the morty version and in the next future the master-compliant
one?


>
>> Besides this:
>> * I created a bunch of go recipes for all the dependencies (following the
>> example of docker's recipe dependencies)
>>
>
> These can be submitted to meta-virt, but packaging too many support
> packages
> isn't necessarily the right thing, since they can conflict with other go
> packages that
> need a similar dependency, but on another version.
>
> The technique that I've been using to deal with this lately is to put
> multiple upstream
> repos on the SRC_URI and allow the fetcher to pull them into the SRC
> directory, and
> have them available to the build.
>
> i.e. look at what I did for libnetwork in docker, you can do something
> similar per-dependency
> and use destsuffix= to get them in the right place (i.e.
> destsuffix=git/src/github.com/openSUSE/umoci)
>

I see the point here, as I had started from morty versions I missed this
approach; I just have to check if everything runs with this approach as
some dependencies are taken from gopkg.in which is a kind of versioned git
repository.. (but then, maybe, those can be kept as standalone recipes)



> * I added and/or updated few other recipes (some are added+updated from
>> meta-cube)
>>
>
> These can be sent here, or sent as a pull request on the OverC github
> pages, if you send
> them here, make sure to have [meta-cube] in the subject. Or go right for
> the github pull
> request.
>

I think they are more appropriate here; just not to drag in another (almost
unrelated) layer.


> * I added/changed some system configuration files
>>
>
> We'd have to look at those closely, system level config is something that
> either needs to
> be controlled by packageconfigs, or is a distro policy. So they may not be
> something
> that you need to send at all.
>

Some are the various init config files (I tested the systemd one and
quickly the sysvinit one) and most important one is the dnsmasq.conf, which
locally (due to a meta-virt append) conflicts with a LXD dnsmasq setting
taken from (again) the Ubuntu install package


>
> * I added some kernel modules - but without a real knowledge of which are
>> strictly needed: I just checked those needed by docker (using the checking
>> script from coreos docker's repo -- https://github.com/coreos/d
>> ocker/blob/master/contrib/check-config.sh) and created corresponding
>> kernel scc and cfg files (I also updated the docker's ones but this is a
>> collateral and I don't know if it's needed).
>>
>
> That would be fine, following what we do for docker makes sense.
>

My only concert is that I may have added some unnecessary kernel
configurations here


>
>> Now I got a bit more insight on the overall process I may try to update
>> the recipes to use the new go compiler structure (but for the moment I
>> still need to keep it working for morty.. and I wouldn't like to keep two
>> different versions of the recipes).
>>
>> By the way, now LXD seems to be working on my test image; there are still
>> few thing I have to do manually after the installation (which should be
>> automatized within the building process and I haven't been able to, yet)
>> and few "side" things missing:
>> * I could not build criu (as per previous message to the list) which is
>> indicated as a tool to be used together with LXD on the build instructions
>>
>
> unless you are doing container migration or snapshots, you can ignore it,
> and even make
> it an optional dependency.
>
>
>> * I have not been able to use it with apparmor (I didn't manage to build
>> it from the meta-security)
>>
>
> this would be optional anyway, apparmor is a distro type config, and
> building it in, or out, of
> LXD would be a packageconfig or distro feature.
>
>
>> * In his blog, LXD main developer suggests to use ZFS as ideal container
>> fs but it's currently missing from Yocto...
>>
>
> I wouldn't worry about this either, we can't dictate the FS that people
> use, so the recipes need
> to be generic and that's up to the distro or image assembler.
>

Yes, I named the above as "side" missing parts as I know they are not
strictly necessary but it was to clarify that atm this package is not as
complete as an Ubuntu user may expect it to be.

If is ok that I start with the morty packages, I will submit the pull
requests in the next few days and then look after the master recipes after
that.

Cheers,
    Max

--94eb2c06d3646f7698054df910fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 21 April 2017 at 19:03, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote"><span class=3D"gmail-">On Fri, Apr 21, 2017 at 12:32 PM, Massimili=
ano Malisan <span dir=3D"ltr">&lt;<a href=3D"mailto:max.malisan.uk@gmail.co=
m" target=3D"_blank">max.malisan.uk@gmail.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br>=
</div><div>well, it&#39;s a bit complicated: being a newbie of both Yocto a=
nd go-lang when I started all this I wasn&#39;t aware of the introduction o=
f go in the openembedded-core meta master (I am using morty).=C2=A0As I cou=
ldn&#39;t sort out quickly how to set up the recipe with the meta-virtualiz=
ation go compiler I switched all the meta to use meta-golang (quite an easy=
 task), which seemed to me much more easy to use and directly produced a bu=
ilding tree structure similar to the one I got from &quot;go get&quot; of L=
XD source (which I used as a reference to understand all the package&#39;s =
dependencies and go building structure).</div></div></blockquote><div><br><=
/div></span><div>I&#39;m not so concerned about the variant of the go compi=
ler used to build, as long</div><div>as you found something that worked, it=
 is something that we can merge.</div><div><br></div><div>But yes, anything=
 we merge now should work with oe-core&#39;s go variant, since that</div><d=
iv>is what we are standardizing on.</div></div></div></div></blockquote><di=
v><br></div><div>Is the current/future standard the version in openembedded=
-core/meta or the one addressed in meta-virtualization README=C2=A0(git://<=
a href=3D"http://github.com/errordeveloper/oe-meta-go.git">github.com/error=
developer/oe-meta-go.git</a> -- maybe superseded by=C2=A0<a href=3D"http://=
github.com/mem/oe-meta-go">github.com/mem/oe-meta-go</a>)?</div><div><br></=
div><div>As I see some work to be done here (I have to switch all my repos =
to the master branch to do everything in a coherent environment), would it =
be fine if submit now the morty version and in the next future the master-c=
ompliant one?=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><span class=3D"gmail-"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div><br></div><div>Besides this:</div><div>* I=
 created a bunch of go recipes for all the dependencies (following the exam=
ple of docker&#39;s recipe dependencies)</div></div></blockquote><div><br><=
/div></span><div>These can be submitted to meta-virt, but packaging too man=
y support packages</div><div>isn&#39;t necessarily the right thing, since t=
hey can conflict with other go packages that</div><div>need a similar depen=
dency, but on another version.</div><div><br></div><div>The technique that =
I&#39;ve been using to deal with this lately is to put multiple upstream</d=
iv><div>repos on the SRC_URI and allow the fetcher to pull them into the SR=
C directory, and</div><div>have them available to the build.</div><div><br>=
</div><div>i.e. look at what I did for libnetwork in docker, you can do som=
ething similar per-dependency</div><div>and use destsuffix=3D to get them i=
n the right place (i.e. destsuffix=3Dgit/src/<a href=3D"http://github.com/o=
penSUSE/umoci" target=3D"_blank">github.com/<wbr>openSUSE/umoci</a>)</div><=
/div></div></div></blockquote><div>=C2=A0</div><div>I see the point here, a=
s I had started from morty versions I missed this approach; I just have to =
check if everything runs with this approach as some dependencies are taken =
from <a href=3D"http://gopkg.in">gopkg.in</a> which is a kind of versioned =
git repository.. (but then, maybe, those can be kept as standalone recipes)=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><span class=3D"gmail-"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>* I added and/or updated few other recipes (so=
me are added+updated from meta-cube)</div></div></blockquote><div><br></div=
></span><div>These can be sent here, or sent as a pull request on the OverC=
 github pages, if you send</div><div>them here, make sure to have [meta-cub=
e] in the subject. Or go right for the github pull</div><div>request.</div>=
<span class=3D"gmail-"><div></div></span></div></div></div></blockquote><di=
v><br></div><div>I think they are more appropriate here; just not to drag i=
n another (almost unrelated) layer.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><span class=3D"gmail-"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div>* I added/changed some sys=
tem configuration files</div></div></blockquote><div><br></div></span><div>=
We&#39;d have to look at those closely, system level config is something th=
at either needs to</div><div>be controlled by packageconfigs, or is a distr=
o policy. So they may not be something</div><div>that you need to send at a=
ll.</div><span class=3D"gmail-"><div></div></span></div></div></div></block=
quote><div><br></div><div>Some are the various init config files (I tested =
the systemd one and quickly the sysvinit one) and most important one is the=
 dnsmasq.conf, which locally (due to a meta-virt append) conflicts with a L=
XD dnsmasq setting taken from (again) the Ubuntu install package</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"gm=
ail-"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>* I added some kernel modules - but without a real knowle=
dge of which are strictly needed: I just checked those needed by docker (us=
ing the checking script from coreos docker&#39;s repo --=C2=A0<a href=3D"ht=
tps://github.com/coreos/docker/blob/master/contrib/check-config.sh" target=
=3D"_blank">https://github.com/coreos/d<wbr>ocker/blob/master/contrib/chec<=
wbr>k-config.sh</a>) and created corresponding kernel scc and cfg files (I =
also updated the docker&#39;s ones but this is a collateral and I don&#39;t=
 know if it&#39;s needed).</div></div></blockquote><div><br></div></span><d=
iv>That would be fine, following what we do for docker makes sense.</div></=
div></div></div></blockquote><div><br></div><div>My only concert is that I =
may have added some unnecessary kernel configurations here</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"gmail-">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br=
></div><div>Now I got a bit more insight on the overall process I may try t=
o update the recipes to use the new go compiler structure (but for the mome=
nt I still need to keep it working for morty.. and I wouldn&#39;t like to k=
eep two different versions of the recipes).</div><div><br></div><div>By the=
 way, now LXD seems to be working on my test image; there are still few thi=
ng I have to do manually after the installation (which should be automatize=
d within the building process and I haven&#39;t been able to, yet) and few =
&quot;side&quot; things missing:</div><div>* I could not build criu (as per=
 previous message to the list) which is indicated as a tool to be used toge=
ther with LXD on the build instructions</div></div></blockquote><div><br></=
div></span><div>unless you are doing container migration or snapshots, you =
can ignore it, and even make</div><div>it an optional dependency.</div><spa=
n class=3D"gmail-"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>* I have not been able to use it with appa=
rmor (I didn&#39;t manage to build it from the meta-security)</div></div></=
blockquote><div><br></div></span><div>this would be optional anyway, apparm=
or is a distro type config, and building it in, or out, of=C2=A0</div><div>=
LXD would be a packageconfig or distro feature.</div><span class=3D"gmail-"=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>* In his blog, LXD main developer suggests to use ZFS as ide=
al container fs but it&#39;s currently missing from Yocto...</div></div></b=
lockquote><div><br></div></span><div>I wouldn&#39;t worry about this either=
, we can&#39;t dictate the FS that people use, so the recipes need</div><di=
v>to be generic and that&#39;s up to the distro or image assembler.</div><s=
pan class=3D"gmail-"><div></div></span></div></div></div></blockquote><div>=
<br></div><div>Yes, I named the above as &quot;side&quot; missing parts as =
I know they are not strictly necessary but it was to clarify that atm this =
package is not as complete as an Ubuntu user may expect it to be.</div><div=
><br></div><div>If is ok that I start with the morty packages, I will submi=
t the pull requests in the next few days and then look after the master rec=
ipes after that.</div><div>=C2=A0<br></div><div>Cheers,</div><div>=C2=A0 =
=C2=A0 Max</div><div><br></div></div></div></div>

--94eb2c06d3646f7698054df910fc--
