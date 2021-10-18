Subject: Re: Building crun does not feth everything in do_fetch #meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: kovac167@gmail.com
X-Originating-Location: Berkley, Michigan, US (198.208.46.85)
X-Originating-Platform: Windows Chrome 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 Oct 2021 05:59:07 -0700
References: <CADkTA4Pr9YDVXSENU2ioddHDSiUoHSRptatUNpHUe8B-tAT6jA@mail.gmail.com>
In-Reply-To: <CADkTA4Pr9YDVXSENU2ioddHDSiUoHSRptatUNpHUe8B-tAT6jA@mail.gmail.com>
Message-ID: <11139.1634561947898698535@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="wTxEI1iAx5J26YmzwRsc"

--wTxEI1iAx5J26YmzwRsc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Bruce,

Thank you for the response. I believe I am running into the same issue atte=
mpting to build podman with crun as the container runtime. These are the st=
eps I have taken to reproduce the error:

- execute a build with podman & crun with networking enabled on the VM
- delete the tmp, cache, & sstate-cache directories from the build
- save the downloads directory (for offline builds)
- set the bb_no_network to 1
- disable networking on the VM
- execute the build again offline

It looks like the build is attempting to reach & out download yajl, even wh=
en the bb_no_network flag is set. When I remove the crun setting from podma=
n, the build completes successfully.

*Logs:*

DEBUG: crun-0.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0 do_configur=
e: Executing shell function do_configure

Submodule 'libocispec' (https://github.com/containers/libocispec.git) regis=
tered for path 'libocispec'
Submodule path 'libocispec': checked out 'fa3e8338c62ae482e509884ee2edaefc8=
e00499e'
Submodule 'image-spec' (https://github.com/opencontainers/image-spec) regis=
tered for path 'libocispec/image-spec'
Submodule 'runtime-spec' (https://github.com/opencontainers/runtime-spec) r=
egistered for path 'libocispec/runtime-spec'
Submodule 'yajl' (https://github.com/containers/yajl.git) registered for pa=
th 'libocispec/yajl'

Cloning into '/opt/roast/bitbake/build/tmp/work/corei7-64-gmit-linux/crun/0=
.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0/git/libocispec/yajl'...
fatal: unable to access 'https://github.com/containers/yajl.git/': Failed t=
o connect to github.com port 443: Connection refused
fatal: clone of 'https://github.com/containers/yajl.git' into submodule pat=
h '/opt/roast/bitbake/build/tmp/work/corei7-64-gmit-linux/crun/0.18+gitf302=
dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0/git/libocispec/yajl' failed

Failed to clone 'yajl' a second time, aborting

--wTxEI1iAx5J26YmzwRsc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Bruce,</div>
<div>&nbsp;</div>
<div>Thank you for the response. I believe I am running into the same issue=
 attempting to build podman with crun as the container runtime. These are t=
he steps I have taken to reproduce the error:</div>
<div>&nbsp;</div>
<div>- execute a build with podman &amp; crun with networking enabled on th=
e VM<br />- delete the tmp, cache, &amp; sstate-cache directories from the =
build<br />- save the downloads directory (for offline builds)<br />- set t=
he bb_no_network to 1<br />- disable networking on the VM<br />- execute th=
e build again offline</div>
<div>&nbsp;</div>
<div>It looks like the build is attempting to reach &amp; out download yajl=
, even when the bb_no_network flag is set. When I remove the crun setting f=
rom podman, the build completes successfully.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>Logs:</strong></div>
<div>&nbsp;</div>
<div>
<div>
<div>DEBUG: crun-0.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0 do_con=
figure: Executing shell function do_configure</div>
<br />
<div>Submodule 'libocispec' (https://github.com/containers/libocispec.git) =
registered for path 'libocispec'</div>
<div>Submodule path 'libocispec': checked out 'fa3e8338c62ae482e509884ee2ed=
aefc8e00499e' &nbsp; &nbsp;</div>
<div>Submodule 'image-spec' (https://github.com/opencontainers/image-spec) =
registered for path 'libocispec/image-spec' &nbsp; &nbsp; &nbsp; &nbsp;</di=
v>
<div>Submodule 'runtime-spec' (https://github.com/opencontainers/runtime-sp=
ec) registered for path 'libocispec/runtime-spec' &nbsp; &nbsp; &nbsp;</div=
>
<div>Submodule 'yajl' (https://github.com/containers/yajl.git) registered f=
or path 'libocispec/yajl'</div>
<br />
<div>Cloning into '/opt/roast/bitbake/build/tmp/work/corei7-64-gmit-linux/c=
run/0.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0/git/libocispec/yajl=
'...</div>
<div>fatal: unable to access 'https://github.com/containers/yajl.git/': Fai=
led to connect to github.com port 443: Connection refused</div>
<div>fatal: clone of 'https://github.com/containers/yajl.git' into submodul=
e path '/opt/roast/bitbake/build/tmp/work/corei7-64-gmit-linux/crun/0.18+gi=
tf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0/git/libocispec/yajl' failed</d=
iv>
<div>&nbsp;</div>
<div>Failed to clone 'yajl' a second time, aborting</div>
<div>&nbsp;</div>
</div>
</div>

--wTxEI1iAx5J26YmzwRsc--
