<template>
    <div>
       <mt-tabbar>
           <mt-tab-item id="index">
               <router-link to="/">首页</router-link>
           </mt-tab-item>
           <mt-tab-item id="sort">
            <router-link to="/cakesort">分类</router-link>
            </mt-tab-item>
            <mt-tab-item id="shopping">
                <router-link to="/">购物车</router-link>
            </mt-tab-item>
            <mt-tab-item id="me">
                <router-link to="/">我的</router-link>
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>