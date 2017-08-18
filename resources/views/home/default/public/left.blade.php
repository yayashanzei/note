<div class="main_left">

    <div class="scroll_left">

        <p><i class="icon icon-home" style="font-size:19px;"></i>个人笔记</p>
        <div class="content_wrap">
            <div class="zTreeDemoBackground left">
                <ul id="treeDemo" class="ztree"></ul>
            </div>
        </div>

    </div>

</div>

<div class="main_middle">
    <p>
        <span class="btn_view">
            <span class="fa fa-th"></span>
            <span class="fa fa-angle-down"></span>
        </span>

        <span class="btn_sort">
            <span class="fa fa-sort-alpha-asc"></span>
            <span class="fa fa-angle-down"></span>
        </span>
    </p>
    <div class="scroll_middle">

        <div class="middle_content">

            @forelse ($notes as $note)
                <div class="item" data-id="{{$note->id}}">
                    <div class="title">{{ $note->title }}</div>
                    <div class="info">
                        <span class="date">{{date('Y/m/d H:i:s',$note->create_time)}}</span>
                        <span class="dir">{{$note->category_id}}</span>
                    </div>
                </div>
            @empty
                <span class="no_note">该分类下无笔记</span>
            @endforelse

        </div>

    </div>

</div>

<div id="leftRightMenu" class="leftRightMenu">
    <ul class="ul">
        <li class="li" id="addNote" onclick="addNote();">新建笔记</li>
        <li class="li" id="addCategory" onclick="addCategory();">添加分类</li>
        <li class="li" id="categoryRename" onclick="categoryRename();">重命名</li>
        <li class="li" id="categoryCopyTo" onclick="categoryCopyTo();">复制到</li>
        <li class="li" id="categoryMoveTo" onclick="categoryMoveTo();">移动到</li>
        <li class="li" id="categoryDelete" onclick="categoryDelete();">删除</li>
    </ul>
</div>


<div id="middleRightMenu" class="middleRightMenu">
    <ul class="ul">
        <li class="li" id="noteShare" onclick="noteShare();">分享</li>
        <li class="li" id="noteCopyTo" onclick="noteCopyTo();">复制到</li>
        <li class="li" id="noteMoveTo" onclick="noteMoveTo();">移动到</li>
        <li class="li" id="noteDelete" onclick="noteRemove();">删除</li>
    </ul>
</div>

<div id="middleViewMenu" class="middleViewMenu">
    <ul class="ul">
        <li class="li" id="viewAsDescription" onclick="viewAsDescription();">摘要</li>
        <li class="li" id="viewAsTwoLine" onclick="viewAsTwoLine();">两行</li>
        <li class="li" id="viewAsOneLine" onclick="viewAsOneLine();">一行</li>
    </ul>
</div>

<div id="middleSortMenu" class="middleSortMenu">
    <ul class="ul">
        <li class="li" id="sortByCreateTime" onclick="sortByCreateTime();">按创建时间排序</li>
        <li class="li" id="sortByUpdateTime" onclick="sortByUpdateTime();">按更新时间排序</li>
        <li class="li" id="sortByVistTime" onclick="sortByVistTime();">按访问时间排序</li>
        <li class="li" id="sortByTitle" onclick="sortByTitle();">按标题名排序</li>
    </ul>
</div>

